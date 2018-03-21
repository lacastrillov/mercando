/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacv.system.model.dtos;

import com.dot.gcpbasedot.annotation.ColumnWidth;
import com.dot.gcpbasedot.annotation.HideField;
import com.dot.gcpbasedot.annotation.Order;
import com.dot.gcpbasedot.annotation.TextField;
import com.dot.gcpbasedot.annotation.TypeFormField;
import com.dot.gcpbasedot.domain.BaseEntity;
import com.dot.gcpbasedot.enums.FieldType;
import com.dot.gcpbasedot.enums.HideView;
import java.sql.Time;
import java.util.Date;

/**
 *
 * @author grupot
 */
public class LogProcessDto implements BaseEntity {

    private static final long serialVersionUID = 1L;
    
    @Order(1)
    @ColumnWidth(100)
    private Integer id;
    
    @Order(2)
    @TextField("Main Process Ref")
    @HideField({HideView.FILTER, HideView.GRID})
    private String mainProcessRef;
    
    @Order(3)
    @TextField("Process Name")
    private String processName;
    
    @Order(4)
    @TextField("Data In")
    private String dataIn;
    
    @Order(5)
    @TextField("Data Out")
    private String dataOut;
    
    @Order(6)
    @TextField("Output Data Format")
    @TypeFormField(value = FieldType.LIST, data = {"JSON", "XML", "HTML", "PLAIN"})
    private String outputDataFormat;
    
    @Order(7)
    @TextField("Registration Date")
    private Date registrationDate;
    
    @Order(8)
    @TextField("Record Time")
    private Time recordTime;
    
    @Order(9)
    @TextField("Duration mls")
    private Integer duration;
    
    @Order(10)
    private Boolean success;
    
    @Order(11)
    private String message;
    
    @TextField("Client Id")
    private String clientId;
    

    public LogProcessDto() {
    }

    public LogProcessDto(Integer id) {
        this.id = id;
    }

    public LogProcessDto(Integer id, String mainProcessRef, String processName) {
        this.id = id;
        this.mainProcessRef = mainProcessRef;
        this.processName = processName;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Object id) {
        this.id = (Integer) id;
    }

    public String getMainProcessRef() {
        return mainProcessRef;
    }

    public void setMainProcessRef(String mainProcessRef) {
        this.mainProcessRef = mainProcessRef;
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public String getDataIn() {
        return dataIn;
    }

    public void setDataIn(String dataIn) {
        this.dataIn = dataIn;
    }

    public String getDataOut() {
        return dataOut;
    }

    public void setDataOut(String dataOut) {
        this.dataOut = dataOut;
    }
    
    public String getOutputDataFormat() {
        return outputDataFormat;
    }

    public void setOutputDataFormat(String outputDataFormat) {
        this.outputDataFormat = outputDataFormat;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Time getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Time recordTime) {
        this.recordTime = recordTime;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LogProcessDto)) {
            return false;
        }
        LogProcessDto other = (LogProcessDto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lacv.marketplatform.entities.LogProcessDto[ id=" + id + " ]";
    }
    
}
