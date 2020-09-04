#include "GLShaderManager.h"
#include "GLTools.h"
#include <GLUT/GLUT.h>

//着色器管理器
GLShaderManager shaderManager;

//简单的批次类容器，是GLTools的一个简单的容器类
GLBatch triangleBatch;

void changeSize(int w, int h) {
    glViewport(0, 0, w, h);
}

void RenderScene(void) {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT| GL_STENCIL_BUFFER_BIT);
    
    GLfloat vRed[] = {1.0, 0.0, 0.0, 1};
    
    shaderManager.UseStockShader(GLT_SHADER_IDENTITY, vRed);
    
    triangleBatch.Draw();
    
    glutSwapBuffers();
}

void setupRC() {
    glClearColor(0.98f, 0.40f, 0.7f, 1);
    
    shaderManager.InitializeStockShaders();
    
    GLfloat vVerts[] = {
        -0.5f, 0.0f, 0.0f,
        0.5f, 0.0f, 0.0f,
        0.0f, 0.5f, 0.0f
    };
    
    triangleBatch.Begin(GL_TRIANGLES, 3);
    triangleBatch.CopyVertexData3f(vVerts);
    triangleBatch.End();
    
    
}

int main(int argc,char *argv[]) {
    
    //初始化GLUT库，这个函数只传输命令参数并且初始化glut库
    glutInit(&argc, argv);
    
    glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGBA|GLUT_DEPTH|GLUT_STENCIL);
    
    glutInitWindowSize(800, 600);
    glutCreateWindow("Triangle");
    
    glutReshapeFunc(changeSize);//重塑函数
    glutDisplayFunc(RenderScene);//显示函数
    
    GLenum status = glewInit();
    if (GLEW_OK != status) {
        printf("GLEW Error: %s\n",glewGetErrorString(status));
        return 1;;
    }
    
    setupRC();
    glutMainLoop();
    
    
    return 0;
}
