Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4993E2771
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700809; cv=none; b=A0xnQ/rBm+jk8hkxc9TWLFPzw3wUYPysBePQQ66MZfwuzkuE42o/pY9HSwPDkpTwtu0SsNA5zZx5cSTktFaOyUIg+xMTdibxBFKTSSmS4IdAfIl8Vtd3dVyS7Cp9jI1E7DqGWWh/hIYvX26Z+6v001cZxhmT7tP4AJuybYF2IJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700809; c=relaxed/simple;
	bh=/ttv6f6dsluA5uZThmcG7fwuw5ldScTyjNi0Up5a3ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdWGHfhD1fa2r17acSdqKFaZQtFr5oeexWAnWgItua1QbfsvHAIpXX5FrKQaru1iBlp2+BC8u7amfM/v/7De9J0+jy0hnladTAZ1cRruuJaK4pZX2dyLzWsR6eQbs9Q9H0e3dQi4GH3BpmQ1NkpBSeEsVju4HozMR5FeHiAS8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2YPTxyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSROKTHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2YPTxyF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSROKTHQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B50Ixe3122319
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 06:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=; b=J2YPTxyFIOo2TrpD
	r6YHmsOhuEbaG2hf9Yvwb8aB4R8LB6HY5rgVme7XpOYln1z43cg7I+iuWtZQk2Iz
	aXOb0eyiKCqexF4Ysip33quqVJ1McbKX+5x8hcz+20uy+hOc78CQXYw7EIPo439/
	LZNCaem63jM+IKY9bkRmP28tguo8dXvztuoHTGy4ciAxtbQ+ZqCpym4xCQ/8wtE+
	sxsiiZY4u0q9BQMzGYLptCDIZrDe7mnqXjk4fPx2B1oQmTNxwWaqC2DNdgEmrFHs
	mUha1aWg/XI9Xy75N0rPjdA+//5OWw/jHjP8noDyqS9Zq10Kf2lrh1UD95YskNeA
	t3shVQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxjmhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 06:40:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3592749a017so542454eec.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791700805; x=1792305605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=;
        b=WSROKTHQIT5OB0H9zCRSmMFt4qDNg048xKQgiTDQcMGTk6OShzz/fB8YREVs7U/Zv4
         XhTHFyZXuQmkEhgurUohTQjKY0ogZCEc+OvZLOFdgPtZflDcEvrOMOkyg4ow/ccbl6u/
         TdeKHsTugjTcJ0/y9byvfKBi83qf0CRUco4KCz1Jnd5aoaeC20vDyAaJyahCAjvmui8N
         yLHUTR1VUWZKns6RJSvbQQktU01QP5ewMOrwgtFzuxSDHS6ot8/zyL+if6KjN7Y068OT
         +l0K67LxZi2QvPpETn9fuqU7qOU276x9SMp9ldd90FqpOVpnG2zSzVPf+ksc9Twl/RIt
         MoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700805; x=1792305605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxQNniTxfj5zZUHLI+CqiLbzb4mfvWapYlrk/rSG0wY=;
        b=nYCPGQxwuiQ52OurZBAWl2gl/B2FNEvrqT0b3eCXM03UdA2OtBfGlg843Eg32x8eDd
         JoVjhED9yYFOjuBgyXAlWXBzFYIZpW//0TAiocrbPpBzZBSEP3uHNxrlAmX0gMGCRn6w
         xdlWeYxdZkPXckajD9X9dkvJivGgWA0rKXl0jCWG706E4v7zDpcWP6d/L62RHmVWhEv/
         uF3QPN33I39513GXVG6TTc5ctSHnK3tnybYURpoKlxd8iJTI/kPGoGUZpWACT8pVT7CD
         Dr0w5zUkf2kolIDe+288b7l5HS/oWKdI+TVyStEHMh/e233UjV0BNpw3WxO88Ra7HiWm
         iFIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9YkN9lhIOlW8PLIKISZIcwlnLbRFZtdd2JwkxEYD7W5RAhpwpX9YKdkVl9SjylVcojzoeqZmjgL8Eqg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9NpzpccKaSsgtUBTxxJnt7DMGSczmfYP/7QFZoYSLHwVxN7Qy
	clSph+XzyspkLfp6OKG7eJu2S6TQ5Roq1zSUDRgYMm47eE7mlX2vfZyOkfVwXSJ8CFJdF4MbHHv
	V7eKWD7A82G0MYb+rNuNPHmvUy6YAuQ1BYEQPSJ5HWspnrUkaATM5P3yoXaiNjJRi5A==
X-Gm-Gg: AYBFou38TMcMwyUyJMnv5TmElI5QiElNtG26S4d2lw8R5H/sT7E1Jr3PP1hLDraajz2
	uaqWS6mEI3QW94bPmf8cPFHvqp5X0qqMztf+as5R6XrX+Q+HAs7GGDa9BR6v3DoeoMGvZQAKSjz
	zaiyjVB/6fngGM3LDoZp8fyUrDwVC9YjPD+or2QGTQwnTInuF4zkDSs3rkjX2XmV8Gwy2iMi9Mz
	3gFfq7nuf9jzzovy2+6E75PwXYP2lxXS8fasncUIvkgOjxSlO/1qEI3AIj+KxuEq057/j8Kp0vd
	DwOp4QQc4aPWUgwXFWmoW/szh3bjwfnh7sTYA9ZcCIHwijCMSDKiTC2wlyo/eIqZS1/r85a1Ta4
	d549u8vL3Z9WAdY0FQHJ72Y+FZ/gYRA==
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr11703226eec.0.1791700804434;
        Sat, 10 Oct 2026 23:40:04 -0700 (PDT)
X-Received: by 2002:a05:7300:fb8a:b0:353:82a3:eb86 with SMTP id 5a478bee46e88-35382a3ef76mr11703162eec.0.1791700803560;
        Sat, 10 Oct 2026 23:40:03 -0700 (PDT)
Received: from [192.168.0.8] ([183.83.143.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm24442161eec.0.2026.10.10.23.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 23:40:03 -0700 (PDT)
Message-ID: <9eff23cd-9f9b-e57a-9e50-a09a9e3520ed@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 12:09:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
 <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XsCl9nHzNvImpZPj6FZ0_ezVXlfWvSp8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX8gujkkFpA3av
 312m/ioBtPnSJwQu0/yIOYciHBMa9wVkWFUcjdHPpqCSit0K+76XGlQQoFQDsDf4Jzcq2nF3mhH
 Z7D/I8+74L2a/L0SckRN3dMKCG8KTjo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX3Gff3rbJevP2
 ajC4eJT+gC6eqyzntytQ7KM+jLAYiqrokjPqk1h/3RLg23ZmV5v5KnNW27LQOBLgPwPaQNgNuPD
 pHfPxyR6Xa20LVXm568QwJWEYlWIju3HMxnjPef/7LleQbFNDyMnvt4L8yQhm3I1DtyAH+ZDpGc
 Lr4aRd0uOCAMb//Z3RjshgJ9PWjfTtWRKjpoRURYQC11Bj87sO4ldyHavHNDW8xtMC/LC/px7LJ
 rIiv3bH//PPwxjdmco/vw2ivFT/PTLBr9CpdRdPL0FjZtVPx9nBmu1m/IGvRYLr0HYReDiUDMZj
 5c5aFvwUXQ7DplngKRktIpWaIR+GKvWAZPv2kdK61Jhkvwl3qlT4OS26wZALNHbvmRfYdKE2dh1
 QEiJnh8JWo4OaTlPJsMRoNSlicwlcDYRxFApuCpQ9L0/dgrGsuYKEHwgeYKVsCF0ajN9Lk6V0On
 NBu8tZJT4I52BIsiSKA==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acb2f45 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ijl8aQlCsSTD5cfZelNzAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=wXOP9t3OkE-NeulZwrQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: XsCl9nHzNvImpZPj6FZ0_ezVXlfWvSp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110026


On 10/7/2026 10:59 PM, Hungyu Lin wrote:
>> +       if (!iris_vpu_watchdog(core, core->intr_status))
>> +               iris_vpu_disable_irq(core);
> If the IRQ thread records a watchdog after this check, while
> disable_irq() is waiting, it skips enable_irq(). The hard handler and
> helper would then have disabled the IRQ twice, but the next power-on
> only enables it once.
>
> Could the helper recheck the watchdog after disable_irq() returns and
> core->lock is reacquired, then call enable_irq() once to balance its
> extra disable in that case?

This patch is not about the IRQ disable depth. Its purpose is to make sure
the threaded handler has finished before the VPU is powered down.

Re-enabling the IRQ here, during driver shutdown or removal, could let a
watchdog interrupt fire and reschedule the sys_error_handler work, which
can lead to a use-after-free once the core is torn down.

For that reason I would prefer not to add the enable_irq() recheck in this
patch.

Regards,
Vishnu Reddy.

> If you use this approach for the watchdog fix, could you also add:
>
> Suggested-by: Hungyu Lin <dennylin0707@gmail.com>
>
> Thanks,
> Hungyu
