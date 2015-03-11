// This file was generated by counterfeiter
package fakes

import (
	"sync"

	"github.com/concourse/atc"
	"github.com/concourse/atc/engine"
	"github.com/pivotal-golang/lager"
)

type FakeBuild struct {
	MetadataStub        func() string
	metadataMutex       sync.RWMutex
	metadataArgsForCall []struct{}
	metadataReturns     struct {
		result1 string
	}
	AbortStub        func() error
	abortMutex       sync.RWMutex
	abortArgsForCall []struct{}
	abortReturns     struct {
		result1 error
	}
	HijackStub        func(engine.HijackTarget, atc.HijackProcessSpec, engine.HijackProcessIO) (engine.HijackedProcess, error)
	hijackMutex       sync.RWMutex
	hijackArgsForCall []struct {
		arg1 engine.HijackTarget
		arg2 atc.HijackProcessSpec
		arg3 engine.HijackProcessIO
	}
	hijackReturns struct {
		result1 engine.HijackedProcess
		result2 error
	}
	ResumeStub        func(lager.Logger)
	resumeMutex       sync.RWMutex
	resumeArgsForCall []struct {
		arg1 lager.Logger
	}
}

func (fake *FakeBuild) Metadata() string {
	fake.metadataMutex.Lock()
	fake.metadataArgsForCall = append(fake.metadataArgsForCall, struct{}{})
	fake.metadataMutex.Unlock()
	if fake.MetadataStub != nil {
		return fake.MetadataStub()
	} else {
		return fake.metadataReturns.result1
	}
}

func (fake *FakeBuild) MetadataCallCount() int {
	fake.metadataMutex.RLock()
	defer fake.metadataMutex.RUnlock()
	return len(fake.metadataArgsForCall)
}

func (fake *FakeBuild) MetadataReturns(result1 string) {
	fake.MetadataStub = nil
	fake.metadataReturns = struct {
		result1 string
	}{result1}
}

func (fake *FakeBuild) Abort() error {
	fake.abortMutex.Lock()
	fake.abortArgsForCall = append(fake.abortArgsForCall, struct{}{})
	fake.abortMutex.Unlock()
	if fake.AbortStub != nil {
		return fake.AbortStub()
	} else {
		return fake.abortReturns.result1
	}
}

func (fake *FakeBuild) AbortCallCount() int {
	fake.abortMutex.RLock()
	defer fake.abortMutex.RUnlock()
	return len(fake.abortArgsForCall)
}

func (fake *FakeBuild) AbortReturns(result1 error) {
	fake.AbortStub = nil
	fake.abortReturns = struct {
		result1 error
	}{result1}
}

func (fake *FakeBuild) Hijack(arg1 engine.HijackTarget, arg2 atc.HijackProcessSpec, arg3 engine.HijackProcessIO) (engine.HijackedProcess, error) {
	fake.hijackMutex.Lock()
	fake.hijackArgsForCall = append(fake.hijackArgsForCall, struct {
		arg1 engine.HijackTarget
		arg2 atc.HijackProcessSpec
		arg3 engine.HijackProcessIO
	}{arg1, arg2, arg3})
	fake.hijackMutex.Unlock()
	if fake.HijackStub != nil {
		return fake.HijackStub(arg1, arg2, arg3)
	} else {
		return fake.hijackReturns.result1, fake.hijackReturns.result2
	}
}

func (fake *FakeBuild) HijackCallCount() int {
	fake.hijackMutex.RLock()
	defer fake.hijackMutex.RUnlock()
	return len(fake.hijackArgsForCall)
}

func (fake *FakeBuild) HijackArgsForCall(i int) (engine.HijackTarget, atc.HijackProcessSpec, engine.HijackProcessIO) {
	fake.hijackMutex.RLock()
	defer fake.hijackMutex.RUnlock()
	return fake.hijackArgsForCall[i].arg1, fake.hijackArgsForCall[i].arg2, fake.hijackArgsForCall[i].arg3
}

func (fake *FakeBuild) HijackReturns(result1 engine.HijackedProcess, result2 error) {
	fake.HijackStub = nil
	fake.hijackReturns = struct {
		result1 engine.HijackedProcess
		result2 error
	}{result1, result2}
}

func (fake *FakeBuild) Resume(arg1 lager.Logger) {
	fake.resumeMutex.Lock()
	fake.resumeArgsForCall = append(fake.resumeArgsForCall, struct {
		arg1 lager.Logger
	}{arg1})
	fake.resumeMutex.Unlock()
	if fake.ResumeStub != nil {
		fake.ResumeStub(arg1)
	}
}

func (fake *FakeBuild) ResumeCallCount() int {
	fake.resumeMutex.RLock()
	defer fake.resumeMutex.RUnlock()
	return len(fake.resumeArgsForCall)
}

func (fake *FakeBuild) ResumeArgsForCall(i int) lager.Logger {
	fake.resumeMutex.RLock()
	defer fake.resumeMutex.RUnlock()
	return fake.resumeArgsForCall[i].arg1
}

var _ engine.Build = new(FakeBuild)
