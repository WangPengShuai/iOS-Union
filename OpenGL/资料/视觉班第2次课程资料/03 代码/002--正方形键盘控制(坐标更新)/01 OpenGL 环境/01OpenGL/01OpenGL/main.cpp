#include "GLShaderManager.h"
#include "GLTools.h"
#include <GLUT/GLUT.h>

//定义一个着色器管理类
GLShaderManager shaderManager;

//简单的批次容器，是GLTools的一个简单的容器类
GLBatch triangleBatch;

//blockSize边长
GLfloat blockSize = 0.1f;

GLfloat vVerts[] = {
    -blockSize, -blockSize, 0.0f,
    blockSize, -blockSize, 0.0f,
    blockSize, blockSize, 0.0f,
    -blockSize, blockSize, 0.0f
};

void changeSize(int w, int h) {
    
    glViewport(0, 0, w, h);
}

void RenderScene(void) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
    
    GLfloat vRed[] = {1.0, 0.0, 0.0, 1.0f};
    
    shaderManager.UseStockShader(GLT_SHADER_IDENTITY, vRed);
    
    triangleBatch.Draw();
    
    glutSwapBuffers();
}

void setupRC() {
    
    glClearColor(0.98f, 0.40f, 0.7f, 1);
    
    shaderManager.InitializeStockShaders();
    
    triangleBatch.Begin(GL_TRIANGLE_FAN, 4);
    triangleBatch.CopyVertexData3f(vVerts);
    triangleBatch.End();
}

void SpecialKeys(int key, int x, int y) {
    GLfloat stepSize = 0.025f;
    
    GLfloat blockX = vVerts[0];
    GLfloat blockY = vVerts[10];
    
    printf("v[0] = %f\n", blockX);
    printf("v[1] = %f\n", blockY);
    
    if (key == GLUT_KEY_UP) {
        blockY += stepSize;
    }
    
    if (key == GLUT_KEY_DOWN) {
        blockY -= stepSize;
    }
    
    if (key == GLUT_KEY_LEFT) {
        blockX -= stepSize;
    }
    
    if (key == GLUT_KEY_RIGHT) {
        blockX += stepSize;
    }
    
    if (blockX < -1.0f) {
        blockX = -1.0f;
    }
    
    if (blockX > (1.0 - blockSize * 2)) {
        blockX = 1.0 - blockSize * 2;
    }
    
    if (blockY < -1.0f + blockSize * 2) {
        blockY = -1.0f + blockSize * 2;
    }
    
    if (blockY > 1.0f) {
        blockY = 1.0f;
    }
    
    printf("blockX = %f\n", blockX);
    printf("blockY = %f\n", blockY);
    
    vVerts[0] = blockX;
    vVerts[1] = blockY - blockSize * 2;
    
    vVerts[3] = blockX + blockSize * 2;
    vVerts[4] = blockY - blockSize * 2;
    
    vVerts[6] = blockX + blockSize * 2;
    vVerts[7] = blockY;
    
    vVerts[9] = blockX;
    vVerts[10] = blockY;
    
    triangleBatch.CopyVertexData3f(vVerts);
    glutPostRedisplay();
    
    
}

int main(int argc, char *argv[])
{
    gltSetWorkingDirectory(argv[0]);
    
    glutInit(&argc, argv);
    
    glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGBA|GLUT_STENCIL);
    
    glutInitWindowSize(500, 500);
    
    glutCreateWindow("Triangle");
    
    glutReshapeFunc(changeSize);
    
    glutDisplayFunc(RenderScene);
    
    glutSpecialFunc(SpecialKeys);
    
    GLenum status = glewInit();
    if (GLEW_OK != status) {
        printf("GLEW Error:%s\n", glewGetErrorString(status));
        return 1;
    }
    
    setupRC();
    
    glutMainLoop();
    
}
