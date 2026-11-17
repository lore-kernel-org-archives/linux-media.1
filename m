Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903449;
	b=p+HG3jVKqcOTTfuze1Jt+sBehmOjfJzIJRQmFTwgySBtftEsv5UU3DYu42hfHG0iMmc/
	 8jKTzOrz8cvQqAVwd7c5wbFo3J20AQj20hhaY0D2nraOV6gMEnqK/uQsgOgwZVSlev7I7
	 qO6RJwLTboht7hLFWIGcRdTZpj9Vp9yD3Uujmvz0kdMTnekf8G4CIE3x1E9ul+3cVgeHo
	 SbUVOLitdUaj23rf+RU8bBW049HScP3BoNq1Rp1cGKHo76sSy1IlhU4wKdNKRXR5SjiNJ
	 d5aa1VdwIkGS0BA6kgqxZV9ho+dWMa4DPHxrrGTfuPfTarfkMi5/G+x/sW4B1TrhAOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
	b=e8/19U4o8FIyPCGnZGUJREbGt6S0HDwk54eUiAKpoFd9MZHxSQMCwnMjst7yx+hOdZcT
	 4K1v1AYJDcynao47f0adGTmrjw480qrOd54vlLN0l6h+AXOhPOvRhJxQ7pfc3N1YjzOpR
	 g0jhOxJMS10JO9YWxdz6t21dXPVv05v7c8c2BEcvhEA5cOtQQ5XfBixpG0NSd3Ok8Ldp/
	 32OqB1UF4pRDPEGwodkKrwXHHh4nrqMAnlwZtdMTRtI/+uybvzCRPBUKRpj/WtO77xu0i
	 f2AmzgcP1NfHbDndw2C1iWbCud3xNVRw/B96sVFC4GzE7toI/f1GynB4SQUW8r6aRcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=loOySJJL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsYUXt3B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBAA606A323
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 08:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CBAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=loOySJJL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsYUXt3B
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exul2998571
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 08:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=; b=loOySJJLdkkjQ5T1
	Q8tq73YjFGgr1oB2njcFGFzehW3yTonyFFkHLOsTpcbNcVSIC5xeGlBaL+RvsuIW
	fEDWCNXm6ItAA9Ora6R35NVQgpqBcGiCdCbn0bSC3BshceC9nttMm1Mg1aFf2TG8
	+VnpBmzSDilLgn9Yqk0hmo7MCWRVp9TMhUqmGWTPROLd3jik36+oRbYEfxKlJcXU
	MVkFJNgiQTR2PGrbdL2IcJjYreQt7wsyQfDQ5dz8zYZRs5lkElY7yGm45mxNTAMs
	gO/uMz/uwQodnby7CG7HpDYnOGvKrlszkjqUC8B1lAJpVTWgDqEH/5cCP3XJ8Z6T
	1qh2pA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0c8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 08:17:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-381dc4b8f40so125349eec.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903448; x=1795508248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
        b=PsYUXt3BZH0zqWeZsyamgIJMkRULCPOYJtgZBaUObipB/VuIcTgQ3sFXZR06Z6J16l
         1E4cokHrI0yAEKKmuSuYgbwbO/hz1UIWslwpeI6/XXSNWaZlWCD9uIYNzKmk/WsA4dUZ
         G1jck+jCOGYWhMj2eWoo0rwSjeD+Sk4SiY7NE5HRKaAJj2PRkl3KJlsFjobeTk/gU/HO
         PUEjR+ChQ9lDCao8Wyw4lf4mo8MWeWcp0+dT/NeQqqWYeprANFp5pT7dUliy/jxBtan9
         /RD+SeOYsqHKgr6yNdPG50DYB2kHy0GnkNnuLOdF5TvH+3eAu5s6eUYtimqi/QUptZVl
         aI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903448; x=1795508248;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
        b=JNbdFbKwdqhAeUGLBDLM/SG/DD6ox3X4C/PFmmpUvaEzrJHi1haghQyCkfh94iBXi7
         te0JQJRE+Gjj4LaEVbH20vWHYWwF0UnGaFPwVrdnGz3KzgRQM01tts69aDYVVtBGXWYo
         X1LB9lcWroN4cvPELa6jbPZRynYJrf+tQ0h5i6kh/VbEXanHugWgguOmfcVne7kovLjY
         a9J+7h8uxr53VLA+I7mRgDj/sX+cU4JqhjRGvkieGPsMwCoVn3PngOmVmjH73b4vRNtO
         j1+9m3K0IIoO5luY5g3nPCRnE55I9UvDpc3VkmQ2tmqBOH8LeVEa7Pundt0hqgEl3d3f
         uhhg==
X-Gm-Message-State: APuU4Z9ZxXloiJcJnFTKrayqqnz3ccgjT/Jyo6oKTavOi84fQRqcQQpG
	n/2SiaGC6jb8kKrbUEigOFLVDI+Px8Noo2/kZTJMTh+v4mFKQZ1UBKDKPy+XbHr7LyCapH3+IHj
	+rh++semYUWcbk0Tn7ijftegDuhMSmqMN4VMDyMNTagRLUVqiS50Gj9HOTMPs3LmZZA==
X-Gm-Gg: AZFdTZdZVm6kjAbsXNLBX0GFxsClcClO3VyI9kFr3VaIFfp7lYmy4IO1D6z8ZpR5HV2
	2R09J71X7c9tAqVmKkH/9iQM+thNLzZJkjkEQ9lX6xlfFcBqXp96Ge2iqd3BqQ0DvmnuWY7MRGu
	a+f7SAqpgNmTcqib8OtUyxF0gEb4Ino0BxkRs2gDuGXTu/l3tcSQqv7hqD6zXHl4XnMRMGj8+VS
	XJaGw93o9Ct4lgBQChx3JOjizZ1buEOd2UlxuVF0zxBhcX9cSud0wPw0hej/pcnSRbx0vEP3G/G
	dfG9G+42KeoC7CPa9w5lyrY7ILDcOv9NqofsKStpQSD5+5x5a64hjmk220Uap/hz6lI5A3TIk6o
	6KSTIbYphn+lviZyDwNmWa3NJdOWCVCVY2E8KbQNqeeeY/s/eNSW78WTHaQTAPSIyCsS8cuj6sE
	ClcGxo
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr15052233eec.34.1794903447582;
        Tue, 17 Nov 2026 00:17:27 -0800 (PST)
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr15052203eec.34.1794903447055;
        Tue, 17 Nov 2026 00:17:27 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm63388577eec.8.2026.11.17.00.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:17:26 -0800 (PST)
Message-ID: <b4a641c5-2e22-6216-7cad-ffeb270125a7@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:47:20 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] media: qcom: iris: Wait for threaded IRQ
 completion during power-off
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
 <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXyoZXBXmfvW8j
 wSfkdepAw8s+amQt/emxA2zsYM7mqd1QzgZwg958Dvbov7xeUpxzV84MTQwrcraIH7/3xLWG2WS
 zt9vDRW1h5jW47POk6pQKMSZPVM6pdk=
X-Proofpoint-GUID: Y36Pu0S1wwwAvOet7qiIJ4OUJRHYpRCk
X-Proofpoint-ORIG-GUID: Y36Pu0S1wwwAvOet7qiIJ4OUJRHYpRCk
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc0d98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=M5-Xm-TX60NQkl0miT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXyLrozFjv2Ved
 Dst9sX1KBSZwXuU6oViqAXLPUIol6iP19eE/e6kNa3M51QtsHgeTbvTMNyvEIXrUwIXS9PSA/MV
 3q7Mo5KJJLx8a2B7w0RfodNtd4xmoCuB8ikOdCeNIDoe/+ngnGGycZHQyL2ZqkK4mfYnodUVGSd
 M2QTK4ZpaHFgHp+qNDcVdQoPMSju94tDS4a77J4qJu9RFeIBpNK1Ncm1uYEYouT3qeEqclB93IZ
 4Heb1yofc0Cb/wEu4pYbB0hN94qtsD7sdmvazY8f3MYCXfpkfM1rmQ6MOuofHEoBHPbE5PHjChI
 amS0W7hLXrE76Gngg0jJOKks825nDm3fPQmFKLUxUafHu8a80vJFRKyJpqG8JxNDFe94qnpM16h
 TMluGlrg7jED7xvI6vjz8HbWsL/hmxB1i+a0jr9/QA6Kh4jrYBoPCyH92x5+/x+d1rx+Iq8oOSR
 PxfLja61Ezwe84l24Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032


On 11/13/2026 6:25 AM, Bryan O'Donoghue wrote:
> On 11/11/2026 09:05, Vishnu Reddy wrote:
>> +void iris_acquire_core_lock(struct iris_core *core)
>> +{
>> +    mutex_lock(&core->lock);
>> +
>> +    while (READ_ONCE(core->irq_disabling)) {
>> +        mutex_unlock(&core->lock);
>> +        wait_event(core->irq_disable_waitqueue,
>> !READ_ONCE(core->irq_disabling));
>> +        mutex_lock(&core->lock);
>> +    }
>> +}
>> +
>
>> +static void iris_vpu_disable_irq(struct iris_core *core)
>> +{
>> +    WRITE_ONCE(core->irq_disabling, true);
>> +    mutex_unlock(&core->lock);
>> +    disable_irq(core->irq);
>> +    mutex_lock(&core->lock);
>> +    WRITE_ONCE(core->irq_disabling, false);
>> +    wake_up_all(&core->irq_disable_waitqueue);
>> +}
>> +
>
> Ouch, this is some mad amount of jumping through hoops.
>
> As General Pierre François Joseph Bosquet said of the Charge of the Light
> Brigade in the Crimean war "C’est magnifique, mais ce n’est pas la guerre" -
> It is magnificent, but it is not war.
>
> Why do we have to hold core->lock over iris_vpu_power_off() at all ?
>
> - What is the data-structure or
> - Logical state (the state variable I suspect)
> - Or guarantee of atomicity
>
> We are providing holding that lock ?
>
> These are pretty much rhetorical questions - the above locking scheme can't be
> right. It implies we are doing something wrong and not really fixing that
> wrong thing.
>
> Holding the lock across power_off() seems to be that wrong thing.
>
> disable_irq_nosync() seems to be a correct fix - so if our locking is so
> muddled we have to go to the above - there better be a fully reasoned and
> unavoidable reason why.
>
> Perhaps I'm being overly reductive here but - why not "just" refactor the code
> so that the power-off comes after the piece held in the lock ?
>
> i.e. push that into a worker and then do a synchronous wait on the worker ?
>
> The chatbot told me I was wrong about the worker because "it would deadlock"
> and I can't be bothered burning the tokens to tell it "I didn't mean hold the
> lock in the worker"
>
> It did make the point that it thinks the only thing being protected by the
> lock is
>
> intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
> ...
> writel(CLEAR_XTENSA2HOST_INTR, core->reg_base + CPU_CS_A2HSOFTINTCLR);
>
> Which venus does like this:
>
> static irqreturn_t venus_isr(struct venus_core *core)       /* hfi_venus.c */
> {
>     status = readl(wrapper_base + WRAPPER_INTR_STATUS);
>     ...
>     writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
>     return IRQ_WAKE_THREAD;
> }
>
> i.e. power off in the IRQ.
>
> Perhaps even simpler - just do the power-off directly outside of the locked
> section... once the IRQ is quiescent ?
>
> Either way I don't think we have a good reason to hold this lock and can
> certainly find a way not to hold it - assuming the only thing we care about is
> kicking that register - do it in the IRQ why not else do a worker with a
> rendezvous or even more straight forward.
>
> void iris_core_deinit(struct iris_core *core)
> {
>     bool power_off = false;
>     int ret;
>
>     ret = pm_runtime_resume_and_get(core->dev);
>
>     mutex_lock(&core->lock);
>     if (core->state != IRIS_CORE_DEINIT) {
>         iris_fw_unload(core);
>         power_off = !ret;
>         iris_hfi_queues_deinit(core);
>         core->state = IRIS_CORE_DEINIT;
>     }
>     mutex_unlock(&core->lock);
>
>     if (power_off)
>         iris_vpu_power_off(core); <- this ?
>
>     if (!ret)
>         pm_runtime_put_sync(core->dev);
> }
>

Thanks for your review.

Moving iris_vpu_power_off() out of the core->lock section can lead to other
issues:
- A queued threaded IRQ handler can still access the registers while the VPU
is being powered down, as disable_irq_nosync() does not wait for it.
- A concurrent iris_core_init() can run while the VPU is still powered, and
the delayed power-off then shuts down the freshly initialized core.

I will rework this in the next revision, using your IRQF_ONESHOT suggestion
as well.

> ---
> bod
