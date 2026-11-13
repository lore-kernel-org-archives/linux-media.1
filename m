Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531342;
	b=DRZzGJDFMve1LoR8E3Kpc1b6tkj3OHM5cID2L2mAdsjHkg5dFC23lZC1UtE1ASzxJPVv
	 mPhcXGgPgCrcP0cyKq76ZTSHgING4aDC5FZdPRzQ9d2UoVzwaU/yRbteAjw1bYB+9vjKE
	 usuKMBWmkpGqCyUlcqjDEf3CsLufMXVa+yV/UqJFsqJnv916HdPVXgUutYatvJsJoKrIf
	 n1f6f8VgIXbmXF12oIJ5pMWed/9MNQXkOhqQJ0RvH7vAgeUt+z0uoLiOAGoGriFVyA4/0
	 jHBUbYjbHkaLt2mJKAJzYMcyBWhNGzyT5C2z/BCsvoSabUF1j597E2Q8NgSDB4tfFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
	b=qKDBQIBrhv7pbvLqQhVocWyH+7ep22Y5EUzjLSnjnIDxiB0evjcDX1HUhWHtgzuTGHBV
	 +jt7+aECbQijSccc+twnnQNoDmCPEyzfwLojx0z7RuFUERsB7gdC88K51lsD5V3hxLBT3
	 iV7s1YHUdggkI/7Nv8vJ4A34r9tFHk4nnQEvFJRRxqTjdA3Y6SANrcWobGWUGwd0S0vwB
	 jU/hav0t2xJDj6Fpo1K7icQ7qN+VuzJwkyRcL/IKSZaj594uAZ1IJRKPMN7bnpbOsXrLL
	 +EclzTuRhEisA3VHvzccjPk0Gq+U6ek1RJoMLB3r854jGMaHj23YOUC4yDC89e+PJlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73D606A32D
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D73D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lbX7Xkre
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso326581f8f.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531340; x=1795136140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=lbX7XkreAKRNKOu5bAAr78H5T54rlJTQ+uR1EUX5bsk5/uqD3MSuwb5tv4C5IgnNeB
         /xFLviFjffv29Y4A6i4p9ESY3p//U32kUVrP6/heuTyMixYJ+MTCgu7Xc+gRySu5Iity
         +vYENv1ugwa8Map53en9lcSuS7np9EDqY4nA3rVGk4qxz5H/P5miXu22NmtXXHrLoqm+
         fWQwyl9ni4L6I8m1pxTTqBFC3p2JqByRwHUEIFNy8KUfRJrD55J/wN7a0ZWJ5SX+HWxA
         AcSij5PmZOQdzDGw/IV4F27lA7imS+nAbkzEIBaCqJRoHgzTGIjPHpUxDWDzNfFNRWxo
         zABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531340; x=1795136140;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcVy99/4546IpPlUV+chsxZxg6fKFHtjcBIv8IBgnDA=;
        b=TSgn83Fd8HrDJXtgPiuESiyhNnYlgs7cPxoQmLKrUV+Z5/gjHB23A7SvSW/DGWAyqM
         s2txVMkq4NZJ4LMrami53GNYKZSeo8ZCIsUVfnf9Fy6oOf0jtVhvYtPC7YIkoBf/Ip2v
         KXvN2Rm2xJc3Xw1bLYTuFU/50ysUou83j4Z+ucAvWxI0b+xuhsdbaHem4KBXGf3XaeBy
         uYek+mvTb6pj+mMDfe2C7TnA0f4lADgGnkwMjzO750Gld/iqHmtpPZoi0sOfnIzADmlJ
         PJ8TjtaKmN9q1uqzEuHqeQsxyIqWo/2g0agAIwoKEw6RhmS3c+kWCCTpkoWU79Z+pZWD
         pXww==
X-Gm-Message-State: APuU4Z+fS5E8rfDbnvHvSSTkKvmomVxQ0MtcaYXmqObzK3QWFbgI3HT/
	Ob31P7o2Lbm4Kd4HoTMxiXYu7XmU1Y3hP94k6R9/ywIW9FsYm3Rj5sWyZ8DZAAScmbY=
X-Gm-Gg: AYBFou28Uh7DhHdC2IM+4UaK/N89rAqPSmr292/QuqvY5difecaofSTNrrjQmLsjL4P
	sQEKQzMqbl0/WBY2cI74xqa718QumfXls1Zk+WyAtIxnqln1MdKmvnUCuaqMhGs6lfTuqIhPuS1
	TqnzkyDBXxcUQ53vt728RKM2Y1Gax1exM6mfp1ElypbSfzMGLXxMNl519GK59h6oouSSq8w2w8E
	Om1KQ5ZTwM9mQY4H7jFaQgoTQE0KeA355uFdSGXSsf7VE2N/ErjA5BtCEhI9RyU5QAGe6r1F/o0
	mpbDkubQGTGPLGq839M7vWQsEH7B6Dlvgj6aThJuluARyW8CTzzq16R0jPXzzhJ2RuhxYGXtUzR
	x5HSF1vssuOrxyZian+I95YP/FPcSAF/uaGM5bRECIZql3HKi6RyscNTrY4jLjTZnF3/Wf06Cuc
	Z94UI6TPX15GhU1Ba8+qFT7ZRUjeZeR45KNjHFX36jOXXUaZIgGoAk4SRhu5CSsVFsBg1T4JyAY
	DINDKzU0/tf/m6/GKlP2sfQZPpWH3fDQf2EDmMM/a+L01DCjDvZV/1uL9bik+NtiSMqBy8nKmhm
	qh0UPGVzLDe+xh8SecCPelwOXLNysIJxu6ZBZZMyaA==
X-Received: by 2002:a05:6000:29d3:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-49c731641bamr1485962f8f.54.1794531340462;
        Thu, 12 Nov 2026 16:55:40 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:39 -0800 (PST)
Message-ID: <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
Date: Fri, 13 Nov 2026 00:55:37 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: iris: Wait for threaded IRQ
 completion during power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Joonhoe Kim <26rote@gmail.com>, Birk Skyum <birk.skyum@pm.me>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> +void iris_acquire_core_lock(struct iris_core *core)
> +{
> +	mutex_lock(&core->lock);
> +
> +	while (READ_ONCE(core->irq_disabling)) {
> +		mutex_unlock(&core->lock);
> +		wait_event(core->irq_disable_waitqueue, !READ_ONCE(core->irq_disabling));
> +		mutex_lock(&core->lock);
> +	}
> +}
> +

> +static void iris_vpu_disable_irq(struct iris_core *core)
> +{
> +	WRITE_ONCE(core->irq_disabling, true);
> +	mutex_unlock(&core->lock);
> +	disable_irq(core->irq);
> +	mutex_lock(&core->lock);
> +	WRITE_ONCE(core->irq_disabling, false);
> +	wake_up_all(&core->irq_disable_waitqueue);
> +}
> +

Ouch, this is some mad amount of jumping through hoops.

As General Pierre François Joseph Bosquet said of the Charge of the 
Light Brigade in the Crimean war "C’est magnifique, mais ce n’est pas la 
guerre" - It is magnificent, but it is not war.

Why do we have to hold core->lock over iris_vpu_power_off() at all ?

- What is the data-structure or
- Logical state (the state variable I suspect)
- Or guarantee of atomicity

We are providing holding that lock ?

These are pretty much rhetorical questions - the above locking scheme 
can't be right. It implies we are doing something wrong and not really 
fixing that wrong thing.

Holding the lock across power_off() seems to be that wrong thing.

disable_irq_nosync() seems to be a correct fix - so if our locking is so 
muddled we have to go to the above - there better be a fully reasoned 
and unavoidable reason why.

Perhaps I'm being overly reductive here but - why not "just" refactor 
the code so that the power-off comes after the piece held in the lock ?

i.e. push that into a worker and then do a synchronous wait on the worker ?

The chatbot told me I was wrong about the worker because "it would 
deadlock" and I can't be bothered burning the tokens to tell it "I 
didn't mean hold the lock in the worker"

It did make the point that it thinks the only thing being protected by 
the lock is

intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
...
writel(CLEAR_XTENSA2HOST_INTR, core->reg_base + CPU_CS_A2HSOFTINTCLR);

Which venus does like this:

static irqreturn_t venus_isr(struct venus_core *core)       /* 
hfi_venus.c */
{
	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
	...
	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
	return IRQ_WAKE_THREAD;
}

i.e. power off in the IRQ.

Perhaps even simpler - just do the power-off directly outside of the 
locked section... once the IRQ is quiescent ?

Either way I don't think we have a good reason to hold this lock and can 
certainly find a way not to hold it - assuming the only thing we care 
about is kicking that register - do it in the IRQ why not else do a 
worker with a rendezvous or even more straight forward.

void iris_core_deinit(struct iris_core *core)
{
	bool power_off = false;
	int ret;

	ret = pm_runtime_resume_and_get(core->dev);

	mutex_lock(&core->lock);
	if (core->state != IRIS_CORE_DEINIT) {
		iris_fw_unload(core);
		power_off = !ret;
		iris_hfi_queues_deinit(core);
		core->state = IRIS_CORE_DEINIT;
	}
	mutex_unlock(&core->lock);

	if (power_off)
		iris_vpu_power_off(core); <- this ?

	if (!ret)
		pm_runtime_put_sync(core->dev);
}

---
bod
