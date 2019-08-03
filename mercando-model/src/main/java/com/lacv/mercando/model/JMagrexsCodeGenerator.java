/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.mercando.model;

import com.lacv.jmagrexs.generator.CodeGenerator;
import com.lacv.mercando.model.entities.Compra;
import com.lacv.mercando.model.entities.Venta;


/**
 *
 * @author lacastrillov
 */
public class JMagrexsCodeGenerator {
    
    public static void main(String[] args){
        System.out.print("Hola Generador");
        CodeGenerator codeGenerator= new CodeGenerator(JMagrexsCodeGenerator.class, "com.lacv.mercando");
        
        codeGenerator.generate(Compra.class);
        codeGenerator.generate(Venta.class);
        
        //codeGenerator.getMapperGenerator().generate("com.lacv.mercando.model.entities");
    }
    
}
