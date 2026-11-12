Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487080;
	b=MAwpuSUdT1TXF0dV3k75dFOAGluBOHeJEyjr+19HpifxTo1s+S6HyTpzTfmJmVfmJV6J
	 cpbRxXzD3aMqLYXPxn1hqQwndm1FyB/Qbq8LSlZXaraDTQN3cHGkrEV5W2kpwI3H+19rP
	 Os7IPrttbf7/JCydwLwweutZjILgpnc5nTnPeZ/XOpiIOkn68XJaKKTCsmmUQheykhWty
	 wDUoKiq/n5KRFZk/WDQkt3n8fL+MiVrKd9Okez0hc7WfTjWvIsBLTfgWsI8PeB38vOKvX
	 JnE1L+bHD94uaiyphefo8VY20MSADrm+3Vizx9jpRcUR77xR4rtvy/GVyKvhK+h5A4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
	b=FCFEfvFTU3ppeATlSKaR90s29ifG/sX3LAiHI4NTijym7jGpSwXUAboc0Ptuv7e5LmZg
	 Q2Ha3Yfaw7bqYPj/CNbsG1OUii1WJhRUrG5Lh1Ii+3dnhysa8HoNJ5Jhb9pE8Sr828D2w
	 7huXEI/fCdKk0k9HAmHSdOyBBopHJFT87nalA4K0O0yP15ZrWtD12uFdO9SNvzuf9/iMJ
	 3y3vffJ6FNO2T389fuNL3FUjWWBNvm9Dgr5nIyFvhwVEtBjLHq9HfQo9n3l+e4l7qioEN
	 tK9XO4ALlLGiZyI///MzlOgcw/dHV9W2abKEx/FMe7VlRv6lrw/NiiQFhK/9pWhPVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ckOi/o0Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE78606A888
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE78606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckOi/o0Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7obtu2818859
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LGSwVG6leA
	os56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=; b=ckOi/o0QcnZRHH99pJLvX1OL8aK
	d98Z8iCmRnBJ19fb9L4yy/spJsZ8xgqitsFBbR+FSlaspGSGBUSvh3t5OiiyJMkB
	xTRU2ykWt9ofh/+ondi48YcxdrJnqayxsUU2S1EcvrGcaUEltMHRFi33lxs8vv4h
	8EmPh7S35wq1r05pAtlVhz3bb2ag98ACHvtiM5vzH6X6r1DkbyNOjKEzxXXWR/tx
	wSvpskvCew/FLxpYeAzuynJaQDRinXJD8HUXsdU/KFyek1BYq+4PhNSeujOUwfhl
	aVOCiCk7CnftIg0ZhKivEctkKVGcBkuLhPawp0tCO2pWXLvdx/tXQoEyxJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e190s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94776ee7bf0so698448685a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487078; x=1795091878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=V5KkL7nRrNrlfLwWnvuI6pwqih/x5qxtaxymubIDSG2C+tQFALtuU42h+oap2I8/JB
         slW3rgq6lLLoc/46leFTOlSt27RtXWOTPkaVQ7dpSLCgeS7BmBxZdHcId8+nV3J5hzCL
         fkbkg+1uDwZFDoDQ3Tuq7SUp79G6birJ9ACZ1ftDBHCfEt6Fl7ugVNiJDPjWI6VQpUwi
         7+SFSc+/Ijrq0VXEJWmWEui15ZTUyvhBDzSgeZuJRiazvXtlWmN/iC/3G1UFl8uzG8jA
         GEn/cAj6gH4WZXKv2DULZYXP1F05KG+Kx2P9ZG7XoHDuZhKNiEKH7njMx3ADWNCSYiXT
         IjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487078; x=1795091878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=G+XieHURMODCXC2gK40vcCDiMlTrcGtXFjtqmnsCpPav0z5dcfjw80q2M+tazpuJHC
         Fv33F94AU2XfCuYvLPAwWD0ALX8zXweisytd6DZOGuMhF7nqc9jQeLfKJGl3bXq3D958
         5P7hfNnVuHPoy9UyszqB9im/tJiMyc1/bJncAUhhVWc04kfAUDwQVCnWnXh1Exd2SDa2
         urs3tdqsJFO+lgb7jzG9ykmcdiO5UOxq6qctZuXIo1ZAqKjNusquClaqQAfBjf34i+WI
         JsinxYniewjc3gAn08lNMh4H5j3o8Sn4We2g8JjSEOTDildnIfxqwf5fF3KvArMofLMJ
         TFSg==
X-Gm-Message-State: APuU4Z/xyYEb+j8iA4kGjWbH2n+8N0nagmGpBCJ1tWcGnwJdYyd0jFh0
	VZf/0gAiE2vvS+vsDNh26kcKfB2MjK6+MkwYRJuEzGtAueVh/9yDxJnyw6jZVpzVCmkpNJK8hD/
	rFuT5vRITB5vqARoGT+WrTEQjRdTFwSSJllXPiyjqoJa57utTDaIdmPsrbHC0TGIEHg==
X-Gm-Gg: AYBFou2V6GXts89mLXSNO0M+dZjlXE3ERqlhZH0fQpOg7TLSMLD2WzOXmyCE4qdkuQt
	UfOEE2vF0ZQBqn23pvoXcFbCidPt5tLrJ0ZUEUCDpdETJKQlkUqEdDzwk201igU6WdvanAocHzD
	21f7q6RZfAajvLAepVU5RcvxfARGrOLi/mQrgFb97J8Xdziv699xpqo8GX0ZypQSJNY3R3HXIB3
	N1PT1N+AEan+AnzBCyZWdPAh03qtjHt93FvJ0RFKITzBeYLgY0WySfmf5kD5W2TFe7t/NTCpV1n
	+ybLCbzhcw0E9j7ggvxEFyx44Wn/xzhamWbkX2u2vd3ugNyJtkXyCuYbPXOPUO0mqo1aaxUBPpR
	qXY5VKSw2ONIECumlhQGb6eG2vJJMTmKZsLdh9yd7d2pl0tlaq5h21IdqrNCRriwJXwWienlWJg
	==
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911342385a.67.1794487078549;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911339185a.67.1794487078095;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7b23bc254sm218990a12.30.2026.11.12.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:57 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:55 +0200
Message-Id: <20261112123755.711756-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX2k01dSJMxaJW
 Ps/+d9tePzCMlKZg6qiqMH/Z5Apuz0dQnW47JpAsicaHwBPxQAjAUE2jsWH+nIrQH6m4UU2UEd0
 kUiDxF5mJg1EYsgGTUcPKKi/spZEz6tsGxsKOxdwrfa5blFB6937Ynytjm+y9s0jd55mw0Djzw8
 64DFK4gKEBwRrf34s20NCTD8KW3FD9NkGOFX4QOm9x2aAZcPGFIivEteuJpqBafe+8bzPutwRkj
 nzqB8m2O39llrmOZmh1crw7PJsEU4PnIXe5ulgcQnAHSUIgL8xopjP3Je2YJtPlcTdWNHKKfJHm
 AipDn4NVxPtCFRq7yW8qOjn2jJ8DnHXlEtxP9gak8WsL8nJpLhlgbWQZxOWVFUbi8y23zUA814l
 KwTEYeRlDySvKdBOcVvABn3Uln0k2riZI51mDbZOaSnMHJbARsitVLMrfRWUnuCEDy1HUjHel0c
 AAVynohW7MaYLD71siQ==
X-Proofpoint-GUID: tuc5G4MRLZm07UbQUNZECttpz2-TRBFX
X-Proofpoint-ORIG-GUID: tuc5G4MRLZm07UbQUNZECttpz2-TRBFX
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5b327 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=FGaIqgoJOpKkMoVgYFUA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfXwloy/n1kbD85
 4xDZa8yWh8x0jKZd9IROCeCex83jUcx4ib+KyvA+E5ihx1VzpRnXdeQm7+zOjX+HhfIHIVoKltk
 3wWGxqVF4yvgqgCJtoBUQwrQmMqYkHI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 09:41:27AM +0100, Loic Poulain wrote:
> I find the clock names a bit inconsistent. For example, camnoc_axi
> explicitly refers to an AXI clock, whereas bus is much more generic
> and does not follow the same naming convention.
>
> I don't have a strong preference, but perhaps 'bus' could be renamed
> to 'data' or 'nrt_data' (SF path is associated with non-real-time
> resources).
>
> Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

Ok. In the next version the names are core, data, config, cpas and
camnoc. This follows the core/config/data scheme from the v6
discussion.

--
Best regards,
Atanas
