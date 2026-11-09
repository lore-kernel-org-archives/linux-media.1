Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245490;
	b=XcByaJOd+9OZLFFO6yPT4wC2ahTYYSOqtQx6bZliSJxv1lz9VzH/3LObrl8exX9PVP3z
	 nIecG4wBS/sHgA1UzUs2X0SSzcV820OZYX9uyowoeYtpCD8NR2ZUopp+1wQ98EZQKUXL6
	 DV5x7w55DIkYTEFtEQANbCU73R/0IzAbF+mOiX6OWubIEXDFxHU/wjsNMIHVtxzo+lvK/
	 lqn7MCs/pJomhxzso9eH2D1/hgS1/GDxLZiXndyROHNSIByiY1TrxG6zG1POHmzQPcIFB
	 CAcBv05fstsDzTkB1r9n/DG1dW8nE0B2IZ0UN5vd+qcDEicMM5PiQKIQJjC7Lem3UOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
	b=ac/kun+QCEcXO79DtOBTBrrBEd4nL5ec0LAbf5YYtdWwTDPpTH3wdHr57aJeI6yqtgZ7
	 yvHyC0VPTpOKkR6UXNdmOO0l4NfA042QtjZ/E9y7plNDRKALr2MHRjM4fRyRla6TVbJof
	 a0gQAVIkWStFnJgi4EZsXxjHMPONg9gpI1w33s7DaGp041aUEnI3aj+ryiBQZuWNquONI
	 kWXL5mASv/JMK65m6xmqtZyEs7rO+6YCcw7yzhWb/lHuIzldVBaZ4te4SyC//Wf09xKAD
	 ckL6MiIMWTMh2A5goIKPbjkTSFeJNV76Af74bklv5Ec1dAtedYVitoMXyqFb+0ffBiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614C606A330
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D614C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HH4uw1525215
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 17:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=; b=NigkGu1qQjA3ANzD
	/6hAxXrynh4xMsmFeYkLy1+iNeLPA3Ion7dkHS656M3psjOOTg8Z68F3UL/vmShT
	zORfzWglAV6Edd6vMHw7X2I1XRAYJHTBO5yPfwkGcvg+wGffn54JEMGgMo3p3rQm
	0gNwi+ptCQDtnMmLpuKeogqkok5wOovOvQQjvKsF9Y0+e8vEUiGlNQlT552S//Dm
	JuQuOstbv7gA7wFbdq8Z1hhCui7x1OX/dJQckDnPQlBn2wOCp9vupFA59465K1fo
	80hwbgKnbNxWn/YXMJp94HsYZXteeOdA4xa69+5RHukwwwwSZB7kAEdDoEKmemW8
	McYjSw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx80qpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 17:31:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so343284e0c.2
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794245488; x=1794850288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=bYwL2DagUmMF2ukutLGF2UDXAEloPVf2gTMQpmEYBeFYUL0L+lsqQ1XBEcy0Q4nzxV
         cTA+KJ+Mh6aHF2eN1cabkKuKQyru2wj0gMKVtPzp/YwuNb0ndX9C/Jeld9Drr/aITJD3
         FwbpmVkte0AvowACovZoXJgoV2i4K5JNvJUjkh8af07KAoqIFf2QUcZ3Zp8BSdq8E2Yt
         uMYmmSrYRxFheXMhAePlHOLlKpdRWqjeZNVkRZXhP7v1U3lzFG2ZhsXLvgSM6vuFzapq
         HGZ9F98DFDBmUdkP3h0DgTCrUc4pa9rKFLKwx40V7siBbwcY3RXT6DNJT3wPodT1b5GP
         ESVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245488; x=1794850288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=wgfWaETaNjW9yftD5fCxPv1piAlrBHAjead/aji6oudmk+l4SikttyA+AFjgcl75tx
         ++oXoZicbDYFS+JOc6FGH9+ivdwykti6+qo+bsqIGtm0T32zbUrrMHtE45RulSJaeLc7
         icM6MuI7wWmbMwev5tr/+PNWYVWdP46lZygFAIRMoo7STrV5YMBUYOZIHJxaK3ZlbPuY
         6Cmw7jUdQB1m+os0ZNzjZPxO5nY4K613SJ/HwI1Ddt0a+3OtwApNYeDQ6n1RVsGkTu0r
         z/h9ky0VMlTCvGLQlt5EGDvkcWEuyX6Lj433NdxoHxGCZGOBxMz5A+EhtbTjdEfdIB9A
         j2mA==
X-Gm-Message-State: APuU4Z/rxQu3CzBj3hI8Zt+cFNNv48HPzJTt1OrglBCQNWa63n+wXc4r
	PSLrDIZvc6J5Zgkaw0Xusk2d4kq/QJT6xjkx1dg9vvISIUnghBZbRezDaAOQ+DZUlz+vvNVJSq4
	zBXUOoGRwNGOowGeTWsw1iu2qaF8Gdaybrf/6AY4RLuNUWDO9JiCn5/qDUuSWQYt6uQ==
X-Gm-Gg: AYBFou30peF5BhHrWEOZ1tnj+hcrIUJbI4qsJdgixpUyh6JvFcmdFqfrioyPPL4EhGJ
	S76lo66IIfzQWLSGT7A/w67hT0na0CpAtyCc6+U5Q/Zj009F2z0FCSPMFNyp7CLCoOoCWAmhK6V
	ocZag9zQALQEMB1PkArc9zArKKNq1X1zCjZUpl3jcXreRFmt6qloaHs7gLoBFKqWdKzHDk1ysH0
	pnRotK1yHa+dwJgaaEMm/+vBxJcpCsGW2XIpjSVcRYqRsGLw3lqfD7q8eZwqARWIxmmWqI0s5aW
	qfHcweaxYhQ2Dnu6vbzKsH0FYVYiIP7Zta/L543Cs2SbaR3csitzPa2hQQSuwcotPviFbx1a8w/
	UswsPd+j/Jhz/Oo/SyxgKLc4+IIQH6SRereq0YaFsjUM9Tu6nFMhHBycmUh+x47bm9pkHLEacjy
	xpdJlbFBWoUv4=
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768668e0c.15.1794245487959;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768589e0c.15.1794245487449;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm3867185e9.7.2026.11.09.09.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:31:26 -0800 (PST)
Message-ID: <93c00a19-9d6c-4a51-91df-ae75ef112cb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 19:31:25 +0200
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
Subject: Re: [PATCH v3 00/11] Add SOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af20370 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=5jSOgbY-jEdhu9h03aEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MbacPARd7fjBo41NjnrfQ5LcdDihLTAW
X-Proofpoint-ORIG-GUID: MbacPARd7fjBo41NjnrfQ5LcdDihLTAW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXxGlIPnQ9OjjJ
 qL01732Znsk1XJQdW+lseeRSwe+oHL+RPQJvt2AJyHp9bwFmq/nxXjOmnbmmR01ta0QIMqqvI0V
 e6mO6BGRKsQMBLzEdDj5kXL9qpQXAdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX7sUPEH8sSO50
 5j2Mw/iszoY4wjne4J9AgnyGnOFDkKGiDhVazaQvZaAxDG/Hx3cydN0D8q+dCUkF+pt17kd5R39
 Sk4KkwwKkZr2rfCqV6mXLEu15bTGyGXN2RRaeeyBa4xVX1EdBPp3NlZka2nKudUlRWYNT9i/396
 XKqChsLn/kTfAs7HK14YR37/i0uaFOgyPM/U8l1+taaDftmpWHEf8VsOsfvYSoFthLZwYHc6tvd
 QIdCaE+em/OS1RiA9FgN68nAytuOMv+XdBB/rKMt5cppczgmldi+1vu0XI5ZK32ydjl/vwVYzVk
 EwXc5wB9GinU8IZTqb/Z8HnyUxVdJXPwpYsb5YnB3TeBX4pEiepUJbPYigrSyBcU6XBgOCwKiSX
 XTRFLbvm/YA5GTEq6euy6LMd2jI24iqeIb6KJj8nQXa0nDZEsLADnvMq2yaPY0tixS3bcx+lFRL
 8vPY5z1xIfdR6OEieWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090069

Hi Bryan,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 11/7/2026 3:01 AM, bryan.odonoghue@linaro.org wrote:
> v3:
> - Added CSID-340 patches from Loic wit permission - Loic
> - Explains the initial -1. - Loic
> - Drops the .id field enumeration - Gjorgji
> - Accumulates RB as indicated.
> - Link to v2: https://patch.msgid.link/20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org
> 
> v2:
> - Amends series title to drop EOF
> - Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
> - Moves QoS into pm_runtime() callbacks - Loic
> - Switches on vb.sequence change for every SoC the silicon enabling code
>   supports - bod, Loic
> - Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org
> 
> v1:
> 
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 
> There is another purpose to having an SOF and EOF event with sequence
> numbers and that is.
> 
> User-space submits a parameters buffer. Kernel accepts that parameters
> buffer but can make no guarantee about _when_ the entire buffer will be
> applied.
> 
> So when kernel finishes application of the entire params sequence the
> returned buffer contains the sequence number - from the EOF tracking which
> informs user-space _which_ frame vb.sequence its given params buffer was
> applied.
> 
> Similarly when kernel produces a statistics buffer that buffer will have a
> sequence number - and that sequence number will align to the frame sequence
> number that the statistics describe.
> 
> Thus SOF/EOF tracking is fundamental to passing parameters, returning
> statistics to user-space and for the IPA algorithm in user-space to
> understand which stats, params and frames are related.
> 
> The first patch in the series addresses a corner-case when a quiescent
> system can take quite a while to wake from idle, too long in fact such that
> the SOF event is effectively missed.
> 
> On 'normal' systems doing lots of things, this is not a problem we would
> see however on my test X1-CRD system running from ramdisk - there's
> basically nothing else happening and the wake-time becomes apparent.
> 
> This is not strictly speaking a bugfix since right now nothing in CAMSS
> cares about SOF or EOF so if we take an additional 2.5 ms to process a
> data-buffer on a fully quiescent system, that's not the end of the world.
> 
> OTOH as soon as you start to care about SOF/EOF then missing those events
> is no bueno.
> 
> The CPU latency value chosen is 100% stolen from IPU7 which seems like a
> good starting point - the stealing obviously - and happens to also work.
> 
> This series is really an enabling series for more work to come but even on
> its own is an improvement on the current situation.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (9):
>       media: qcom: camss: Introduce CPU latency QoS during streaming
>       media: qcom: camss: Introduce SOF sequence tracking
>       media: qcom: camss: Use SOF sequence tracking for vb.sequence
>       media: qcom: camss: csid-gen3: Enable RDI SOF driving
>       media: qcom: camss: csid-680: Enable RDI SOF tracking
>       media: qcom: camss: csid-gen2: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
>       media: qcom: camss: Switch on frame_sync_en for x1e/x2e
>       media: qcom: camss: Switch on frame_sync_en for csid-gen2
> 
> Loic Poulain (2):
>       media: qcom: camss: csid-340: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en for csid-340
> 
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 39 ++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
>  drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>  drivers/media/platform/qcom/camss/camss.c          | 65 ++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h          |  2 +
>  11 files changed, 265 insertions(+), 5 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6
> 
> Best regards,
> --  
> ---
> bod

