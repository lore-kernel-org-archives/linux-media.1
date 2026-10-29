Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793291786;
	b=SIC2uo48TD704O6To6DUu3yqsQ3YyqTBkmQFWbpQQp7aOG/RKnT8K8Ev7QmOo524HHGg
	 iKJgVUczWFMw6/m6nfddDDiy5Qh2Nou4FrKCl7PawTOhwz7Xt+TBNwbwBvM1HIM5z5Vz6
	 2Jql587HVupC2JL3I6sc3lUsrSYl0YtW3g6EqYDDf6r9bMglQKkplrLC4TGltXvMjdRC+
	 T1sCWDISl1Xl5IQd/OYDpuP2M6bQHYR59iTWLIaj6nf2iVVmhy9I0wedReadTMgbaf0VC
	 bmXE2fXb4W4dB5nncWe6wgIvEVXnQeOP5MxWB8z0GR4Pm4Lc0XQZQEMOw51HOmngC1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
	b=uP+CNRDE436sCvEx+jKTVihGgGQCCsZhwSTSU//ogtWtJI2yOgek+PXg6jiHiKrvDf/Q
	 qyhqHLmAAiKfioaQOp/OJ+uDn5Y80c7Qqnf+7mb1gMSaPSYvQJK9K2R6LnXEotm2eIirf
	 iUAHzijzO44t6Y/1l4WrKFrVyTTWS6Qgjzi1v3/ZhhMB+VKsmFks2edkl2hWrUDJMExOm
	 5vcwczBk4YVN8Q8VJGiNKuwpV8fHFJ/Eh+dYYIrbNbgLpkd5gLCv5UbMK9maQ8mfVkgfy
	 ez9O4bMmGAgskopfaYicxltmS3RuTOjCSwT8SWGZjHXlYWIKTCI9KiX+nlJlNdQ0+tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED00606A325
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED00606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJv5fObZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HvUS+66i
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD36K1143410
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=; b=YJv5fObZsxXrs5TJ
	JP2FiRwWcJLzY5Ooe1F/a4kjaCYdASWRjwzbJPuMGDfG0c3vlyjsFq19kXD+kuLC
	etB+pXh+AXmUftAnGybcVOC60/TpddSjI4OKAU0X1oxm9HQB855J/efC0ZxRMtd7
	myEoK8Tq1P+B/0m2ER1b4r/lGjnAtFCgQ0DcryuBM+TamOsCLb1fWHn4zjPIulti
	PsGlwVLHeLm3nxKNwK+zInI8/Zp5YM8NmeEDPgAR/T5xO8sGKo21OsJ2NUASzYED
	aZ6+/5RE/8lR14LSqSbAtnd2CopMflOF9YgLtPoxGT0xhECZ3Sxgfbb9b5cmiAy2
	XaOzlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76cgvug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:36:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso176675585a.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291784; cv=none;
        d=google.com; s=arc-20260327;
        b=AGqbOIjEuC0j5jfJ1kOj757SR+C09Jw98NAGx60Yox0BSglVvuaRA8yKpOmSMRhhkK
         UHgT8TsWZnrxMdJ977UYH5ihc7HCMabPnN+PZxIZFDONRCED/mspyCiycWjOp4lE0RDn
         ggg1j6CsFUr3AH5QnasFPPh3flEs38k1J06u1zpe4G3Nq1I3n383Zd2JfAB3FRRPNgYl
         2LiMCudkg08LkmoKLbYIZN0gFnIiB1trqrsPYi86/rTJBn2l+1vRv3v3KkWrIv/puMzx
         VRZbzqZBXtkwSWuDpHEDSJyvyxvDbByitTh/uInC+DG1uj6g31khKHdbBkHbO+5p2BDF
         TtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        fh=VI1cueeZU3YjtrBULOXNk0MiWG8I2FSNH5q680qAErk=;
        b=iiuwewbHFcvbJhV3iMS0odmTGm/4O4JvNvTubUj/avRA7Yy2BulcX/OB3YYb9HsHyT
         +w9bzKHj0IGpwsB//KyxEZ9ik0g3bWe+r8EsR+VHSfZ7wcBl4gscc326TdPDB/9QbtFZ
         QqoQ05/padHm1kIMY4AQV3OhpQi/0v3dq0Udk5h4h+mNte2MXFRSPvM1bX5TykjIzKNy
         PTyQ2r3F6wfWR20epDYRP5XnvoIqbg5KvSJ7FGB63BZBAifrKIM6YDkLal0+U5yx54o+
         iZiTfy3mfB7GBxB6+8kMXIPIJB8a7ffz7Lt3cL+FHhqAxUrgQ2mk/qIytgHnHwYv1G1j
         p1fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793291784; x=1793896584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=HvUS+66iBocUOf6Y1f4wvmfEKo4eVByzq1G05DReTOcnZ4PT0yBwqHvLyibsw9xHLB
         Fn88CxtZsBgUcz4xfaNXyukAjDjwTOIoUt76UWuhA6obvgK/0ODgMoSW4jMTvUoXV2wP
         dPUxnWOe8TjxP0Fh8RoTzITb/XkCUVe2FL25UqCichmKz+b2fvBX0PaWqyUYJ8vwj9vH
         FWo4aRrRLAa6s7IP4C6aCM1oQiyACPmk8R7v/zNzq5M0nMcYcBFcLdhB4+8Mi00R0SH9
         E+Jhqv/ygTdcTgfno0MPXRRoC28jRH3tA6TcyLQ7GhM+QZfJ5dy13rfW70BAqUiKwy4t
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291784; x=1793896584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJdI7lgw36TcxKveMl5fMT9rIbHK9w/ZYjtL1gqVF1M=;
        b=Cfe3CZgLTFhqRgHAF4bGJ0HgB2qghyKOFZrCKzISXbdmGtVNXnhaQB4ePDHYu3V8I3
         978yvHbP/7BDIeoeXABJ2N3x7PemSUQTNIDkI56gwxrFHo/yipweRnXgoIGHWHHUccnh
         YYPINPd3RcDiVQipLc6hzhvl/PjZwjdfD9CerytRIVkVSkr771gLe05jPwOWUWzqBq0z
         mmX4DNR4zwRxAYgvaO65gHSgMEtCLvs4RJIZ10k46Hfy74OGweqShwPNSBlXxTsHCXS3
         wT9ro9YnCnolsGWERjRarBAbzjdHg6q4Hk+epGOBnv8c+3QeZ0f6Tl/1jl/SZrdm2qee
         Z72w==
X-Forwarded-Encrypted: i=1; AKwUvBwAfc4KmuYTCRx94Wag/7YT61Pjq8KKp7/yPnVreaDqypvrN83Kto2hZPx6bAyqb1rkZ8ODl6a+I1gs9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdea9G42Ajp9jDQtZswEtsJ4qd7AKS9ya+1Jce9G/9MdR3C7/j
	Qwi8XY7n9dqlePhk+4lRQvQ7/RD5GjbIweR0wF7KO7KHEpelQGgVIhuY4ejIi0RwHyKu65U8hA2
	WOz7gCLchn8erwWVVdxQUSVkSxsQtjhlcZrQQfrljIlErncDT2lqvKM00LmlB7Mvp1WQZthNAdl
	+Dg8rKlEs+MU9vXiy7OV4eEAPagogm2ajx4Ngiexdp
X-Gm-Gg: AYBFou2JnIz5JiJCA59hz2iMsWQTQLw69IGeqpt4PEarPJXY2lsap/OtLYSswHZjexZ
	5h6uxshi8uiyYS1cM8buuBVIy/ZDcVe5uaTeSp84chd5PD/Cv1ucTjUhVO6h/cAJggnYw2e0IDb
	V0mBW0Vma9unJfH+NegJDhm6ZV7FwzKogg+aZtaTkcBrmsRgIRkhn0nRpELzctXhRO4JmvGepsV
	nn+Of+WkSSyhjDzsVsdTxrTfgYFW9c5InOhNJifYnDBdycJLzOA3dc7csl8zg==
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id af79cd13be357-9441338b4cfmr451653585a.23.1793291783861;
        Thu, 29 Oct 2026 09:36:23 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:93e:53db:d59e with SMTP id
 af79cd13be357-9441338b4cfmr451650085a.23.1793291783401; Thu, 29 Oct 2026
 09:36:23 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org> <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
 <CAFEp6-1Y=OyFHPnGER0GvGfTpc4o3_wTvXncvLWM81T9M-7+kA@mail.gmail.com>
 <1371d5b5-d347-4456-963e-8effb4a82f27@linaro.org> <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
In-Reply-To: <ada94208-4a90-4e3a-9d9c-1ecc87b53d6a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:36:11 +0100
X-Gm-Features: AclHuK-WDQCkOQS8rm3sz4w-2NNyFvkqhd1R2IYzL8N9_O99RTw_p5nx2kiOD7I
Message-ID: <CAFEp6-0xQTOvTHJyYBK_iT+wz=yrHgufi68NJ5vgEn_PMZx5pg@mail.gmail.com>
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fuQIl-FzISPEM5sOQqoLpsc7BSdjeFoD
X-Proofpoint-ORIG-GUID: fuQIl-FzISPEM5sOQqoLpsc7BSdjeFoD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfXwiN3kkcQ4cvc
 fdjKxE2wJaW0hvcY2ewDsgKnznIlIPJXQYc2tsHMu3rzWI4hlcXgbYEPgwDNgn/BfrhuxlaI9fB
 862khEG9RHAgAkrhuRO6l0xfv/sg2e8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NSBTYWx0ZWRfX4LtjexMXZG8K
 AEBMtrH/ISNs5OCVcYyi4xtdFHIPykqYx+ifcV6EthEj5O7I11bxIdBS45QhBdV/2SpCnoMPUaj
 6NvqQbxu8ZwgEKfLvhZqQQY0WOZMVQ2X9XC0GvTyZLEz9AT4KYUpgTJiIuXIE4OZbEh25WQA9LT
 EWsjW4xPtqxo9OcsZ7fu+z4dCRvdXQFgWTRXBeFDFrxWROYZB/TODd1Js601ZWQAREpOxNnoK6t
 27vBHpBLPv5RxDZwMAPbuQB+Kz/BBRqaWx2O/AQb8zqrzG/AH10BGqnfuQThF+uD8PGAPZ5F4hp
 vOgDN3k0OLEem9E8s0drqhIRR6eSbBXN1SCQXrZzLtpz4DS7IFXwvJlbMlcyhDUEJHM3PRYGh7q
 E/OYmaYqrANiEM1V/OQRIHCmhdpxdw==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae37608 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=3Wac3Xa727c3rp011QQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290065

On Thu, Oct 29, 2026 at 5:25=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 10/29/2026 5:49 PM, Bryan O'Donoghue wrote:
> > On 29/10/2026 15:46, Loic Poulain wrote:
> >>> Is this something that should also be tied to frame_sync_en?
> >>>
> >>> Also, just thinking out loud, are there cases where we'd want to
> >>> toggle this dynamically at runtime based on any V4L2 configuration or
> >>> pipeline path? For example, should it be enabled for the pixel path
> >>> but disabled for RDI?
> >> Obviously, if userspace subscribes to the related framesync event, we
> >> should enable it regardless.
> >
> > That's the behaviour already :)
> >
> > Again though we want SOF so that we can drive seqno which really
> > _should_ come from the CSID signal not from buf_done() *
>
> My opinion is if userspace does not need on SOF events, the buffer
> sequence may not be  important. However, for use cases that require
> bundling and matching frames from different outputs such as DOL,
> it makes sense to tag them with the same sequence number.
>
> Therefore, if this feature is enabled/disabled if userspace
> subscribes to the frame sync event, this behavior should be clearly
> documented.

Ok then probably better to have a consistent behavior and always
leverage the SOF for sequencing when available.

Regards,
Loic
