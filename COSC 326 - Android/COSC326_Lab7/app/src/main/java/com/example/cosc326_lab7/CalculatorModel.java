package com.example.cosc326_lab7;

import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.ObservableField;
import androidx.databinding.ObservableBoolean;
import com.example.cosc326_lab7.BR;

public class CalculatorModel extends BaseObservable {
    public ObservableField<String> a = new ObservableField<>("");
    public ObservableField<String> b = new ObservableField<>("");
    public ObservableField<String> c = new ObservableField<>("");
    private String result = "";

    @Bindable
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
        notifyPropertyChanged(BR.result);
    }

    public void calculateResult() {
        try {
            int res = Integer.parseInt(a.get()) * Integer.parseInt(b.get()) + Integer.parseInt(c.get());
            setResult("Final Result: " + res);
        } catch (NumberFormatException e) {
            setResult("Error: Valid numbers only");
        }
    }
}
