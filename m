Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628815;
	b=V2VcO4FgEc8VLv5Tgh0uT+DD2NeThmkQuCaQHVAhIKJzMgqMKtQ92QOqWU+cNpTD281q
	 66txvzgnDV2CZloR01jAqIvX32IFtERQPOrFzXFjdPAhQeSr88ZX8llt1sr3KGTTqz+Ke
	 6c00WQcxSi7JvGn6DCzTmKyweCrqEqZgKDwUoUSOH/hl1BX+Pu6eHDQKRNSucJVL+DllX
	 qXs5MDXMmUqhv+u7D0qs3MJ77MPRjTDlBG9ZNfdbOQ5+H5t7d8mNfQlNOvF19QmXc+zWj
	 W2HDSsYiAFkQSl5R61GT+PYEa6FLOmy7uwXNz+/q6H4SgpVjWzcsbHtI008r4Qj+XFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
	b=VVcqW2xBTDFZAeYIWYhgAMnks5jNS4uNmgw962c9HwuD8GNz+2HBl+VkZHQM5TFDjMVw
	 VbPas2ld9gUfzVkkwP714WepF8og+Ly3HQWOrsgHsPFzZwdBn4Ayhtk1K86nNoS8YkBTX
	 LRsiIVr7MlhxC/lKtK3e09XG0zcRCP5zlgPs8UULD3XeACycI5cnr6dc9QSfzxCN3G+Uk
	 Fg0xiw7qi0RXLfhfyw2OrVmD1ycQ9WAa9WvAYPWwM3/YFeJvSbfpRG/mgBptHgPOufwDd
	 idyhSD47w8ZK9qCNX6uYVUlzzwGf4xG5kCHAhy5pdYFwRV7qZFO4AY4OrIvX+5zVVSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7F60A2600
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C7F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NSPfiE6x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jQ6JP0Q3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpMnb3102689
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 14:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=; b=NSPfiE6xDo/8ghGT
	6+PlD3PTv13crzBoIbAabwHN+sUM171Dsg0nNyn5WVfwt+FAcdD+TS8V3OFfYkJy
	eGBnFGmi6oe9vBGlWyuViw6kKM01FxVeB2sIY9rorxieaw4+yp0VENa3lh2NwTaz
	G8XE8qn2L/GfIw4rHpKDcikxHKxInEy9f7AHaUWnZ3fDGoivVY8/6d0qiR2OxX84
	5IEApv/Lqb+eZ6LJ452H4S0yDCKz+1BevqEP4qb8C5+JXZaF/GdHCCxlUiKy2Z8x
	mlyczYI61o5nzjLuwHbCL9qH4BGbBKRford8bYycfHwO+F9DDvbkV2erlr7kSLzL
	QaMCdA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj5nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:13:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7253274eec.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793628813; x=1794233613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=jQ6JP0Q3AT5LTg5mjngOu4+nnonZ3bu+jiRFUZQNCOEvz/ks4ba7E/UXm0DYj1kulD
         r7LNHjhw2ooyZ7BGtkna4LJoDjdcIrK6aHFhmkYL1i8sHPETl7hO6MtR/uxrpf4Gl0TX
         vs/ky0VmOWXCh17/lAjZMfZH4vPujucXhi28q2bip6hsF2FZ7kSGu8hijwTUZQ0n6n9X
         eGrcIWzmw+AS+flkmzyaiQgX4GBg+i8qzNPd3Yzm76hNVb/xyVYW1tW4HiMsW7Q+scYi
         N2YDeRdJMG++e4VdhqGKF1k+D1/NLKKelvfIO/U796ZOsw+ay3kbhmH8p93vVtSRDGNv
         FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628813; x=1794233613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etOvMntf1nczIGIsJ4cq6agyr4snoYdtxO11Y4gBbfc=;
        b=RX8GurAUNzUMy602hZASxUtLbE1ZimaAHtbPuhFUDRUMawugKb5bQLHfHLGvb5eWS9
         VhUhX9UaMMKUNBzCt4aK6vRkBcY9V5YNsCKrRRdNx1Am+FBBA2cmnyZCWXseQDXc6P9I
         /289K8etwVNRuYcedfgjQSXjdaBpw7JB/D4+VNSKgfy5IjuibeIz8KMDdePLkvGNU4cI
         nUAskJq9vYzOoyv3nru2WDqe+g5SArYjIFzdm4pNCIQCTffbxtDBmgHvRRzdO6egoiCg
         OBbJss5tqXlWmOVh3VkkY54ZLb6JA7ziCDUHqFckThu3CbvhDQyNzoKGcwF1CGuISJQt
         L6cw==
X-Gm-Message-State: APuU4Z8a3odHlrDEvVvYhw5AAv6Ga464HJKcXd4tmD2Gp9667naRR6TZ
	IJKRYHYd5hUODnz3SqsJ/7DTvsfVhz4DWfh+4raItaLpaPle1lMColpn9Mps3mRkL2E0ECW/zdn
	ULemMRrD29rWHn8OlvCJUaDXKTEMVSzpis5j/HCvu6UlKLn26g5nPTowdGapFtqE1Zg==
X-Gm-Gg: AYBFou1L31SlO/vHgSNnW1td9AaPuAKo0nRGTSwcvUaiz5d7SS3NdmjkcgPNQWVqT5L
	p8WkuNhDmMDNRO3AcvPDzZ2FX+d9NgMyd2EvA1+Q57KdHJW0KEBtzLEPK2D4mahF5IX9jKCjCI8
	hW1RLDzTVMTieLmCk0v8qGsoiGWQ7nb00EROYeLw85FRPuo9uYQOvMd9ZxAbLRg+VKfer3RRBkM
	I78kO+HI4mVyrZlDHihp9KvFfdTGRsA6FxY+UAWqaH0vLt0xCk779MDBsXKnRv/ZVsitCn5AhPb
	Nz58y1G8taaxUXhuixSNvGvZ5RGd3VhHxHS+B6CGqIzyRVZHgRpgx8xCtl3dBLvAN+oGLbYz4ok
	m2jjeG3PTL06HQlbGgRSG3HKKZXWbg7L6ZUXwK3ooZ6lImltU8BaYU6SVIOWw9nIdDwusCa0f2Z
	H6ACxupw==
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614544eec.5.1793628813300;
        Mon, 02 Nov 2026 06:13:33 -0800 (PST)
X-Received: by 2002:a05:693c:2802:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a4220407bmr14614496eec.5.1793628812636;
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm44416221eec.22.2026.11.02.06.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:13:32 -0800 (PST)
Message-ID: <97033b9f-8fb2-4571-847e-7ccab661b93b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:43:27 +0530
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
Subject: Re: [PATCH] media: iris: fix ltr count rc_type validity check in gen2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IF6w1LVcYDiYMsNasaWF41fylrWPVAIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX8paA7qX2becc
 eOBA0YxEw7h5oSWnrssuIN4TxIn+5pqCeygBZDY+U+fKi/2Zyzh32BghloscXx4vWMd2Q0DCizX
 e8rpYntRs0Vj6vYIkzzXA+pR72MBkiVKFgLE7+iTwduHmWimWHseHBvrYH/CKx0tS+FuElOXFbG
 Xs1fXDBM+baitokUZyac802ZZ58aZoJm39oeGCGJHwcmVrUXMBEWXgms6EYuR4042DCgC4GWfgR
 mYk9OFQWf0adxX4GIJ9RDb+zd/veu9dLkgb6iTBkp7C8otDyAiL5U1u6FVJwJ42boe6F83cxOGy
 GMHw0HOCeGwA7wxPnNyE8AwtA81phES92OjHlTU72pvNUZidKE2Hd7Ohw6ukrJ2Ifw30SmQ3Efr
 oS8LYeYMz8567cAn8r24bNLJ9QYYuoUgl+uYAn8/xUnHQNVB/B2IPk/KFaNamFUXilYSsGCwiX8
 3Fq7Dx9xELD+fASejFA==
X-Proofpoint-GUID: IF6w1LVcYDiYMsNasaWF41fylrWPVAIk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX5/5wfuNNAylW
 JF4RJHmFlMYZN9jCLgafp39ShmEw59T7WxaETMsKIBDAyXZF5fmrJQEar98uUQaNujnbwFHBciZ
 SThDZUOaRU65Ne8zO/m90/isT+H4gI8=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae89a8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PxXcNx1syzcY5Y30yX8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020056



On 10/29/2026 8:42 AM, Wangao Wang wrote:
> The condition was inverted: CBR_VFR, CBR_CFR and RC_OFF are the valid
> rc_types for LTR, so reject anything that does NOT match these types.
> 
> Fixes: 6870381285b8 ("media: qcom: iris: Add Long-Term Reference support for encoder")
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
