Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC7480325
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995705; cv=none; b=LHEDrwos+gN4hyWrAteTLEqaZT6TwGQKoRCJRqhJfp+bc26rGvL0v/0NeGRU4UP+ja+20j3PDiY9vmuXIBlAgKbTFsr6MjRk/JVj0JvQ9iK6HID1MS/jMhHT1bO3OmrY4j3hVXXjLokLA6WwhVGWsA7imUGnlVhwYu7+hFDb9pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995705; c=relaxed/simple;
	bh=WSd0pp4dLViWUrVNvqX/zEMET0G6qSs6EPp7Yqwc1hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLCFUSEHuItVEVVzJ+Dfp2KJtFZQOp+E36MYi/VoYWPCEtlX5ARaCPol3v8xXXbifZejIuv1rO0yLCLB6d9KZNXyjxS/jkT8z/k2O2XNsQg1EQ41i27D3GYi36W+NKpG2nVWGLn9az5mV3bcoxj72SVww4MoYqz5+o1hjlrgeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfvBRkZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SP6pYnP1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfvBRkZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SP6pYnP1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AVWr23591605
	for <linux-media@vger.kernel.org>; Thu, 2 Jul 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=; b=PfvBRkZjmzECsBBG
	l/C6ulvrOWW4bO5T1i668/9LoIoIo2Ot+p7CPfZm512Yi2E36QZsz7lY8yGaehna
	LRfeXadKYb+gb6eYOF8BiIUQJ0KAdwl9pBVviZn8WLgczw+4oNwnpFa8J34gtGqi
	3vGn3Vf9jKgZ1GgmG9fyB7AeynvUjvAslZT8Nc1Jdd435VXma6rl3XHXShg4aGn5
	WkgGtwXY9nJRza2Pd6UHqASdWQ9JU6zt0cJqiccbZm6zVd8EjPuoGOfivPfBUfvM
	K+TSJEBYu+SKlIEfYHEpZUKipLVSiQXbKLND9kl0mBASZneU1Ai4Ivq4SxZVPhVu
	wV16OQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9qev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 12:35:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efe683bb91so3977566d6.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995701; x=1783600501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=SP6pYnP18iMiU9Y1n51fTR3U/5o2/Fi+B+wXOdSOcSr22XdumuVdSxa1JEQ43j7QS6
         06kB7WgNdVg7UIWaicWEQ4j6Fr/gShp7HzVTnaFP8pNwTdwB/a8t2pEPMUfNoiamFPQU
         Uu0NYK89vxsoJZuBSTUA7nqhPAc96/5Oc/QF8mIKzMLjyFYD70YMePF3qClnhqaiIEjN
         Jy0zgnPXZhfwA6aIUNuc9bDOTgfwEIhF4I6a0MbgV6pQAsCwgh+Es6ISNaSB6/2M2WLj
         eNb066sk6Bpb3Kou8T91rBMM02ynWlje2ULRZ4eXn18siVTp7Av66SwdhRLQwhd50r/v
         EFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995701; x=1783600501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=SA6fcycurzdIJICvlLxpv0jwd+ZAQIBcIDfoTdQjKlOGTzJWbusAetma5D7iRCsdCR
         FIKV6B+m42NIJACLr44FiMgz+2GJbLhuUgVelDpkMmqexGbH+idRckD98mIzKGJ6jLCO
         c73aEGTc0EQZ6C4wtlIZNfyR9C/e7pt8b5ZrFntubBN2a/OS0PArL9Y6LE2ObzZkmf9Z
         Ys/evqnTXeH0+EyMpip0DbTpLJfZmaS+p318sArjOKgsfWegbdqe+BNH7C8swCkfPQbZ
         2GEQs+thfMLhZj10B9ER4m3nAzW2bjElzAYTd3EAIMBuPHiTySj0x6hibYpKmEEvu0+l
         Irog==
X-Forwarded-Encrypted: i=1; AHgh+RpOsYh8PvaOaLV+9H4nMrOaZGde1N49N1mBLiX1lvo1/zB6Hy3xAMktzzsnwmHG6cMX1lfqd7VO/JPPuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfDjVOl2fFs17DuJFSWZ6YqpHdtrOXJ4ifwwX6tmCigu8dUxT
	O75IdqQn1fHzR+SQ5drv443ieM7gpvZI4C1ZmvcGUF4E5AzLBU8y7foY4WAqLNIPfGvy8WKfqGP
	+HWU+H2GDlKqri5QPB4GSoPpVNTubs4zgfd74uN5ZkIN2IqEBFtmKkD9c3dBHPKRTRg==
X-Gm-Gg: AfdE7cmY+3B/s4LongSKTTTk7ewLdqw5OTo6JQ0chx9WZ910BinIgHWBelkItJsDavV
	1tvDe/9dZFsWHaizw56DhSNoj5/A2KStgyBno0H8Qzl3X5U7Yg1/XGzdrn3AFTMr/hTbVCfN/c7
	SDkB4M1EsRrTEyzitfzqPtAaeJ+TOvy6iRvMgBDepIr6PY7/2YEEwJLuqclWlwbVnWnOustizqX
	7D5eHZP6R6uN6yvF1Si1fXK1DVvM+bMXOiStOFtjWjJtRXpQjzLqJo6RI3zwnRiW3MczN4PdGST
	AYsDrRXOVrSChUe0z/9nV9VMDutrzLCVUVNbVoPPkX2ODLsJRP3+SjFf4YNFMz8StvyXuWf6hPw
	KbN4Hsdz9lZfpPURYDRrInK4U5w0b59UlbjQ=
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486716d6.10.1782995700705;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486116d6.10.1782995700253;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm895805a12.26.2026.07.02.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:34:58 -0700 (PDT)
Message-ID: <46ab1a2f-45b2-4580-afea-a55073fd29b6@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:34:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX38E2lvlCQ6Zd
 69BisXCYXTZpc4+jcdcOVnVtJX9sbR+gwvnhSvr4xl7fVx3N3PN9vVgOvWbq8kB37RRKWNkr7u2
 Bi3jGKvWAQfq1o4WYT6sbybmyQAiooXnBBBnP2Qf1oasmS+3oY/wjp9pgApq8hYLNaCrfImSXnY
 V/9aS9enRcboI+N/EjD7QAS1ZWe5KElKmKnXL1xo+y/+63/UnIOsV+bNDgghDXOQPLB50tXhRvf
 7uK4hWhutbaTHesgVuaurLB404rhSEcokux0TW2SNBdB0F4e3SU1lGvFzZlkZzSgdMUDEdTs1PC
 gAyBBUkr4M0XXfJXQ5C6FqA2YhojrQ9EPEo3b1invx6YwCxs+XtZxmjfIBZ/udhDP6Ruo6Fdm3c
 x96yOoq/ec9b3zgaHMzj6hF4r+zt5ewJhSDl14lLEWXjVlz2Rx41IM+SupGonZV0hkRJ0Yt+dF5
 BDNDIjGP+8vCmM2odeg==
X-Proofpoint-ORIG-GUID: L3_Ld_Ad5N5a-yOLRuN0_aRMAu5XdXta
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX2+l5wuW+LbGU
 g9eabaXN5RR5aCB5Ta/ZYuRY1O0sDNTQBLYMUHrgReI7rnzOIHXSrspeAC0ftAQNrw5qWOhx/W3
 jqwfEnNrK3EVuTXBbZrM47IBc1HvnEA=
X-Proofpoint-GUID: L3_Ld_Ad5N5a-yOLRuN0_aRMAu5XdXta
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465af5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5GrnyDZj1TGYcITIosYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020132

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
