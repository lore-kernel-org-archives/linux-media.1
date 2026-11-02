Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629955;
	b=DQXlAUebdmKmbcsojBq/7q+9BLR/zG33WISZUPm6s4FVLAN6gTMUTHJMttOvnogwFIkf
	 XLgiwuQTsZEDsGUglfLYIURQ/sdCoCVgpVaKkLpd6/5xOlPHLo/0a1bgQC7hISeim34XE
	 miSmU4+lSO+lXj1aC8mcTX4Ee1JoPtKo41L2m3hikuPX35qgmro61DUxcawCXAZxDakoN
	 O+1hDVwwFtTZW2qG7DHgLgb4OofriaGlcoZNtxSTdzjkPajJHdhWTJCQ/KckWLx6kZhbk
	 /VtGNLdnK2Wr11m2NnJCKtdxflAKAjbrdCSnidNU8QCKD7vwzot5YZc1oYIWQ15glTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
	b=1P++yj3ef/WBe6+JWiKmzSHD+h+Y5kmyzLEP0S007xHkeouyvtSCKdie5VsBuUrVBuVj
	 vT2yXgLkukKB98KTe/yxUcS6SoHhqnxGsbeGfdzvAQlLhUIhx95BndY2PJDAvSpZTvIyi
	 wZOm+/7fBCG+esI9KPpNwbwOAUEqLcF8jTbhECHTpHv1nYNzNHQuKXwl22dMmYGZNoViX
	 avBfEmuVSvrQUhxH7j6N4TheTySGg5H53i6pi7gnzcsFLAVUp3kDzcr8fpwASf3XoL37p
	 dd//0e/XqNiE2ojx9DnH2i2YNgjX5F9xF/aO5+1eZLj3imr0EJX2Jnhj7VlTnBGEVQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8en2+Ur;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CEE606A925
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CEE606A925
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8en2+Ur
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpP2Y3715873
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 14:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=; b=YLN0WTN+XVkEx7nS
	IUH5f9NLarjyz5TCoJOBfaK3X3KXB3pngGNkh288RgrCE1yU7huXhCt7VOhRrBWU
	N3m/BbPksCEAXHujSBTDAHPKfkV5H33xSDWyve5/g/7Bg/c8xc492CJsX1tnzn0U
	KOykRu0pe5lUPvsNQGvIXrTuuwc86t6PhDMml6ve1Y/kLBkuFmlnzFFpVzSCnkxl
	Hsms7vyat6HC4nLMtI3meSb62sQo99lzBbB6MmlnsuL61F/o1PN9fiLjf5AHeDT+
	XfzcGJlc6ADexvhOWMGwMAjjBdwY/eOGcaXht8HAtqQYxCBTrZs+h7Exn3KWvVK3
	NPvaQA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62855-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:32:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso105961137.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629951; x=1794234751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=U8en2+UrMfuxKclrj1Dz7HZWTgJSABlWYarCb6pl6mepyd0N/KJz4rGcFgT0qhV01j
         L1IDUF7aAkB5VTuyrlIZPjKqjJZ//gWUk+EdriaRUW02H1eercka2bvqS0tqbDdYxlM/
         K0i7FyqTPWOHD2HK4H/8heoC+6PFzfU057eUKRNthhNRhwCEqIQmyfSRRxnKFDDuLAsU
         9iVU1/uXNInL7PpqneHIcSakfieILOLrk1w/lOP8u3cx61QFBl0l4xbr1T6FrGSHP59t
         yhKatfRdWox5JsShHizBml6dOCNKCcqH/hL+EZR3WFZ6WnQX/0nsGjJAC0dh//HL/DLi
         n2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629951; x=1794234751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=n+QBoiPGmk9QJO3oqxOKOAuXpfIMlHYHHAuMicv2tLvrODgWMvZC8NWGwkSn3dMulZ
         wulBHBXu5vUKAZyhtfKnMqzJWlC1QGDMhSyGNqCGwIEQn//uqbuqJrYMZFrS7xe08Vqj
         n3URqJFrxZTJZobgWigHh1SGu6a3GLg4bwWxlcfpaWcUGkDfM/g/tNVjoXrsHi3kNX15
         DdgSuanK3Ry076CslP0u0q+DRjQUQDHYz74pLBIpflMNDfLBkSBV1b0LD/IRDN/3WbIz
         Q+azy67hJK6t0Yx4S0JF54Rv9ay1hlsTTexb2a961BTNm0zb5lBRyhn6HIwxQKTUM7fm
         iyEA==
X-Gm-Message-State: APuU4Z+tT4g6H4MpeI2UMQ4uZA40j0/2ku7oTUkW61dy8oNybG+Hp47T
	zizh3WQQDWAW9XN/5Q83bcO7f2rN1CGvD6mwiro+emaj3MKlvvTAOElCpf9Ye9cf/C70iBJPajb
	neRSr4XDc/KUxD/N9rYGQAXs6TmvY52O4lM29tt7pA5JNAQ8jxQTtleUd5sa+UXy9sw==
X-Gm-Gg: AYBFou0Mu2MhDvxMykcX23eFXPP7SsYRg8HnbIdS+EVEHyBA3i0+AIGLsnF0UUxx6yh
	LVOGq/gVd9cm1PgrsEgk/8ba6OIfEZ9jatlGjvMvyazorON2DWApYY86KL129kvdqfoJo6QAkvc
	2rBi0V+lgCLA8aQhgKH/wPZweTogJmyPxBuffuARKGjcBt1WSqas3k5qDlJXQsYVQs5xd3qfSco
	ZxUHDYX7+HrYUqspMHiO+Pc1zPnrbmWoyzBDEYTVW70pxm6Za/pKCbvEMG8GMu0MDQSttoPs7sN
	++R4D2ow1NCmevbL3vcgISfYjxHXAl1XgF+EgPXZZ918H7mlsBI1Ba4mtZaOXEAj9XSZyA23mWo
	MDei+Z2ZE835lE1t7LedoVKsclKbVdkpzMk006ZNE++33LwpF6gAGnuDP37Kp5dHrT7j4IIUjAz
	9Zfp0gz1bBcOw+9HJmRMedrf0YkiIdFQ==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582514137.0.1793629951409;
        Mon, 02 Nov 2026 06:32:31 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582490137.0.1793629950943;
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm418712a12.33.2026.11.02.06.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Message-ID: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:32:28 +0100
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EGocAMuhi9UGLmns8hM656WYPORNmjnH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX5JNNlfuYPFWU
 5Cstu76DzS7pml8h2tc1ZQ7cr9czhEKtla2icZinvp2wcpSYBvDnX3cqcUl/RNH69APhrpO9JDc
 eE4SiR0pduBHbP30xrK1QRbIblgxViM=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae89f00 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=xvBfzxcjuVojlPD1IgYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX0QXWpblaMNdL
 C7VduyBa5y3PkMcT7gpVRlgSEsfzZnsONoY3Caf+YnJNtuo5Ij2KaDvLp4Xx9on3tob7WQ9PYEP
 0ndhgVTwrAHWtrLzqjTPwEd07ODviEFXJhKEyAmSL8nbRMyzpRYN7AKe+C1souYm3wVM38zGEKe
 wjhqG5NkU14Dv4cADJNb7gYjS9rwuUyWxvL8fEfrLQRjAGxhBXgI1GL+VwiIepuEsH1fsjfYuHn
 7Y+2ZfK1YQM2zZYEoEKntyPN6qBLYwGexAsRHNPuZqOU15gqv/BDTEvorJBKwLNP2NSaMOGqseY
 8h7niZjHF44iB/Hn2JEyGDBkionhxJj0OL23R7h078HtPWO3bfp76nSvQDvM7gX4yzS3yWmIIBr
 WFDDMEWGgJv09nNJQR3Np2dZvG3KV3UYKh+Se4W8XStYeIew8hpBknOLbjs6ykW9luqtzzhIDTq
 pFiprX3OcwOZ2YEp+pw==
X-Proofpoint-GUID: EGocAMuhi9UGLmns8hM656WYPORNmjnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020057

On 11/2/26 2:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Switch frame_sync_en to true to track and consume SOF/EOF data.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Is there a reason why it's gated behind a feature flag? Will
exposing a SOF seq counter that's always zero (i.e. not
implemented, never bumped) have negative consequences on
userspace?

Conversely, what information (i.e. platform list) are you
lacking that would let us make this non-opt-in?

Konrad
