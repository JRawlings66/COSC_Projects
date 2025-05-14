package com.example.cosc326_lab7;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import com.example.cosc326_lab7.R;
import com.example.cosc326_lab7.databinding.ActivityMainBinding;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        ActivityMainBinding binding = DataBindingUtil.setContentView(this, R.layout.activity_main);
        CalculatorModel calculatorModel = new CalculatorModel();
        binding.setCalculator(calculatorModel);
        binding.setLifecycleOwner(this);
    }
}