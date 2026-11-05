Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793910954;
	b=w2FVb7dMRn/9U0W/AnuxNpFrNwnTbyJZ4Ojn9zD1sjdlg7esc3RPreqqrlVHKMWhJiLD
	 WQMsdbU6wZBXslER/oYPdAJTefYmRNrG/YI21LnHuF5P8pPZDDOL8x3g3Fci2x56XIVJj
	 c4KgoXkvzXfl0xFsbWO0UNKP7GStxr9hEf1VxdYo40bwP0thDSfa1DKFPMGK/0i+4lZD6
	 xwR+n/hCod0CmUL8dvYoQDYv+CjRyfDso5Ro/1yuUaUUVZOP6mZWM0bcbN3Ei5YDGNBQt
	 k4YImxP97nU7e1bxWW1Z7q46LvRV/cz4sr142bI5surHubgPmi/+Hs79nBLBM8vyV1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
	b=R7phufq6942UQwj4Wgcf3ITIleo4qDMnHuTwSzRdUfThbUcLw1zE6cdfrMeqYx/W52N5
	 clgXN8A7eXkGNxKjeHwHqoaB1F7lX5gGnf69wiDSoXjTAdYxNCRbT28jaOslfkPxjC7Dz
	 0K6jIFta45T9lz9e7v7ZhiomoJLG3gjmJEyCopBwC469z9tWEHUZfomI0VI20UjorqD11
	 ps8OIiepvM5Shhy5nI8bd8RBslnKn5U6GDhVlbyKkVhayULNeXRp7opt6BkcKqcxQe7lp
	 ZEcbQuc/l+IFN4eeW8CEHFZmAYE+VD6HfOjQ5cgGgjw/q8zdXtNZBh0MaYguCqMzJsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pence/o0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D66606A335
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D66606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pence/o0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZsxUHvad
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeAbU2433571
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 20:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=; b=Pence/o0Cr96X+co
	fgfH3MYzYjLkMYp3ywfGF285Z5K8sEYtTt9YdLhWA4l3yxMaUc3yekzmOMd6+Kx5
	tzMyurTVfA6LL00YVnQ0WcmXB3ernbUy7xZcehnAGYON87zqufguq60jR31Nk3s2
	ZEzfM97q+k+o4geKZZwd7FMGLREKATlHHvVjeXkc6n0duUvCzaW/yc/6sJeS9LGz
	JHwFscz2BNx9fo0/FSDxxmLBjxMLhqbJPWqnlU+ySSAt1SfRGIeWOFTSTzhEVaCD
	Y+BskzXxQtjI9MQKmnxGtgX/Xj2AJ8Op1moRzziDuj9V/gUOq8vyDZcWRD35psiV
	EWtsFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd2rn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 20:35:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso483958885a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793910952; cv=none;
        d=google.com; s=arc-20260327;
        b=CZpf+LalyFl748iTvRYEnk7jigYFDPQ7Un7OCVCeGnBuvGIRiq296KnuALsQ9Wr/oq
         WZ+jyRf7E7kRL14bsdLm7yqSOStDrVJrrMHJ39oxznoL1pcBYPp9Cs8S7yo0983lfa/O
         6xPafkTnnLa17w/He8bPTgdKsXv0d24yGLf7tmWl310HeY0mJ7CbkydAYeVtbGvDkEwZ
         Cy5SaMvnUSrB9oRva65acbsTqXKV7DrOeDelNS37gDgFkDv98gdd/rplGfj7dn9JREX2
         CSDQLxtrjyRgZediuhPd/wJEwsObVmupZCsoMA7pe6jC562xJhLz3ufc26HxrDwK/c/J
         zqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        fh=eKcrxUz5mFFwDiRsX8YZqRSJBqHeacNMaMQYE5eXzhk=;
        b=MudtV7w2FbIZD41h+pIfpTme3fqWpV6wEbXOfeDikYzZguCLUkdIVt6CVLOYizvnD2
         uAP5aDVml377cn3jitL4F0wepgM73UcpFaLIVQWqPxUr6FhGTvB4STXrjz05IhRNuX4e
         imflcMZw1ZLGoLpc/dMkbZrtN+eSKKM/T/JD/6s2EkTUjche+c+4mpuyclA4bEzCoDNb
         8Ma0ZfiMWMvB1ntNHMOXFV48SJxF/t23MzqronLb2bd9W7xrCXhXdnH0rfvqSqmYw7s0
         UQ4S8GP+Kd/VMVbzRaYTl9pSkfDTv85d9GrdYSoaJG2u8GVw29T4QAVY7xvM/zAI9EZU
         o4LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793910952; x=1794515752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=ZsxUHvadDdTjjnU/lVNQPmgNKOXgVpg1Z9qaRHFVGT4xgTiaEDWczoLMnd8oVKkO4M
         V1HdQd1d0fzalYWGJ3QmMvp6+eFVNID48pFxIF92MVMpc8zjpHgpP0PqNKmfyhCqEpqb
         QI6bl+bHAQSAeFeVaaudVEtl0SpLHvSrzyNe5BgStgpMFTfh/9Dic8bL4G5KSyBmnk8U
         hIBdZGDo0UbTx+2hRzjYODsdiawhgRBpyDvdyFGkAj1PiTG/h5+VrQjNt8h6apmcyq/u
         GKptG+C6LRxj7cfwGl4OrAmkd02peyH0tZfxO/Yx9ndu6Op8E+6D9SGrUgA41dXqfL50
         B5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910952; x=1794515752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqSpUJF5S0KWoneHnBAKxwcgej8MtSQ7en4pjHv6yjM=;
        b=K5zlTN4AMpBvsQZn5YU3uaFtxi9W7WAHRpMoXEcKCUFj3TMdaQGmYFx3mqNNM8G19d
         dkZ80PXtmw0EPBpD3pcwI4xUhHMsNE3j1ATU35llF5MCWeimLE7w37wLmV//5SF4zmN3
         jzZRRLcpfGG7mQKERKb7biGbogMWDndo/cXEGGE0h97dqoIlfGUm6ZYpBxJrk+R9Hd2E
         x0kB6iXpimPI4C2xQG706rmai9bLjsQ5ABEm2KyQGfBDwsd8AP3ajshUBZaEiiUgODNl
         Q60npvj8x8ZznxZGGgsFJb/bBWTgBY0T0hAmBK9KPEahk4909q2/IlzThCI2UgwgmmLG
         0cKA==
X-Forwarded-Encrypted: i=1; AKwUvBwY0qjJpR78tLcmdGriqgSbBLwDY1XasC/e5+v0nGtoDCFlqF6tij/Gt0TsWcFP4Phv3qy143u7uF6/uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FHulkFVaoi2rFG9ctordDznhRIYRkkT9iNpzHDV9iR6i8Nh5K
	mDJTFTGQyZRpci6rwolRehHBUlcdGVTxcjPGtbrHfS/pEFgfCgunx9xP6nMzHVLHXops4pUl7Z2
	WDJx9tntTnE31h4Wm7CvAN+lJ5k46FC3SAaXkn+GrgmBJVqbSryDVDMD+9YGrW9Z3YoRHzqKWBi
	CDDcrgsdwwOo7r26x63ShK/kHB3D1noRVcm0M5sSzo
X-Gm-Gg: AYBFou3tysG7iu8I0CmhlAh79Sqa9EfixQUG/1QE+5bVnI99QHQXDwHHcr4tmp39jN9
	vr8aPuCbSjVZHpSIZDg4l2jFNsvL4dWbP/ljquPl8Qn1+QtMieP3ZD0K4y25qxMIxeV8s6t3zE3
	dPVMabpWm/fAHLNvl1WIhdWEaTLhgiu7Pb8QFcyosqwuC2smXh/TlQRn3KAcJMvq43cqauD47zM
	TNtujTyQoZe+Wkj0xrICG9avF5jBLwOu0QXUlDQYfRKHnjMBs94w3hiORgzPU7aK+dCUZ36TXU=
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id af79cd13be357-945f34d7e57mr40708485a.14.1793910951520;
        Thu, 05 Nov 2026 12:35:51 -0800 (PST)
X-Received: by 2002:a05:620a:838f:b0:93f:3bb5:5454 with SMTP id
 af79cd13be357-945f34d7e57mr40706885a.14.1793910951121; Thu, 05 Nov 2026
 12:35:51 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <010601a0f11c4762-f4775077-f8b1-4000-bdd2-d36d7658c606-000000@ap-northeast-1.amazonses.com>
 <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
In-Reply-To: <010601a1ad265b72-97c3eac1-cb56-49fc-a50d-c5339e11e9d9-000000@ap-northeast-1.amazonses.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:35:40 +0100
X-Gm-Features: AclHuK8XUhhVbuJuvKO7cztGu5gbxLTTlaYVpQOBsiS-Amrfp_ILfbRVbQK_xpg
Message-ID: <CAFEp6-2vZT+c9fz2Ob1LvPQBjChOpCdAYa0qAWCyiDg3s4d0LQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: stop started subdevices when
 stream-on fails
To: Jizhou Tong <fqwqf@fqwqf.xyz>, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, hverkuil@kernel.org,
        todor.too@gmail.com, gjorgji.rosikopulos@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX5/qmf+sz5uuD
 Wet+buCkL82vBDcJcrr6G7UNlELhdapW0BZqGExEiDM+JOKn+ACtmIAurtq2m93XxCMlh0lRg0M
 wgFqKG4RNd/pGHPx8El6+yeJ453ajdg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX95V8cWmakk4B
 dUj//q4Y8B+vUTJNr3kgfkmGdwwuGuyuKsiVmByHxDMuCDOcuT8PogFXWthVOSp/g3hip05YzAE
 zQjGWTkdV8HvqD3KSx42Jm3LDNtJ2OYZRhnAmFeaEi0uZ8wesCJTmWcNbZPPnakYGpLiDY4MzpZ
 8hR/Q53ACfNsnThugdlwsHiu94kvpp9LbkAMiEZwdCOqWtCK3WNB7MZtvJZ6LTcp4yILZUQAMIJ
 XKhLobW29FrdzdgORpoqQ2kVoumkzcyHrTeYx++jmSsr5a4CgO/nQoE60wJducydSAZRCH0hVdO
 KXAwTbqVPGAeTJj7VVpUc4rR1l9tir+eGeOd/YYBCgSHAnUmAYnKZZa7YET1MKN6UEmPOjCJiFo
 mG0DtkKFQtUePYBJRu2Ya/wvtK4DotlH6sBx0aRMqfPq3+Rc1sHZbfVIYKwWzS1t+mEGPqssArY
 2ORlMYjMJyqnAL/LmeQ==
X-Proofpoint-ORIG-GUID: pWFgge_HaSwcXFR0ZOGZbwFvp9phXizv
X-Proofpoint-GUID: pWFgge_HaSwcXFR0ZOGZbwFvp9phXizv
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aece8a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=zfNuECduAAAA:8
 a=8g3GZXDhwfvaI8gMI10A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=EUuLU4E-60pLtsqvbPQD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

On Thu, Nov 5, 2026 at 8:18=E2=80=AFPM Jizhou Tong <fqwqf@fqwqf.xyz> wrote:
>
> Hi Bryan,
>
> Could you take a look at this stream-start cleanup patch when you have a
> chance? It stops the subdevices that started successfully before a later
> subdevice failed, preserving the original error and unwinding the pipelin=
e.
>
> I checked media-committers next at 6628e7d4c6b2; this cleanup is still
> missing. The original posting includes the SL7/OV02C10 failure case and
> the fault-injection harness. Please let me know if you would prefer any
> changes or a rebase.

There is a similar submission from Qianhui Xu:
https://lore.kernel.org/all/20261031041154.308030-3-xiaqinghuan@mail.ustc.e=
du.cn/

Regards,
Loic
