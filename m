Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830006;
	b=1asA12rFnkg6AxTSLzKFRsIVanFenGbF1EgnAKe8276H68PalppwhtK7jkqQYgA/qKkG
	 kr4AEARI43AaYp/NXZdzy29MGa6TzuQjoCuc0wtRs4lPIevH0p8t5N0EeyA15nsfrhKAN
	 OqyIO3OPtsJDfc6bhG6LVNhRQSsOqSSyqhXg1TbUJQdnjWbuZ5MqCwusDrXZi2fEwW7Gw
	 ZRs4lbxyGb5v3ZGn/F+nGiDN6GK30IGRttQXQRlHadGNNsWL/VhrF+x1B1YGfkQ2PFYMy
	 0oEnPtdwr2q51tUOsLctYTgiNppjUNsiOXquxZuZe8V4dcyBPX4YFGwn7ZlCIhHvQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
	b=Ib9wIpI14XF5QmqHbqYRqA5mNICruEZGeth5xUY84UhuxexxAWCnsTSRfnPxNWwPjdi7
	 tpWvNREej/jb/cPsm8Fd+cOCS9fkVpna7e9O/NSBqvHPkxHcjexSjz7lf9Cpw+b1UnzIG
	 oRFlROLBdyOdWGqjs+0nsxaktdk71GvDG+XHhRUcHpscnhVqXovFndhi+MYjBqlcVAfDJ
	 IMhz2q9S23PHm9Ovoj9I6MpevIfpIoJK3fiU2Oc00vrQa6IrEgMk2dzZl7wplvnkBUKkO
	 SmwxpKIcF63tsB24erxgypMmOaUgM0s48JdY4QWjVABgDIjbhYzu4PRshtMZGckR04g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCewLPDk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EXcExY+/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056CE606A324
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCewLPDk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXcExY+/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O4e2U03322964
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GWHL9All+sd
	wJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=; b=FCewLPDkOJ+qp3ajXIb/IX0SDcQ
	lhDmjdenesdG9rV7Nt9bmTlIPeW1fBLjCzwIESJAsVpVV0KpaHTjD3uIWy3DMwAW
	HL8PiuGTu9+AAKxbzcnSWUfyixJGn+UgT9ZQzMJSl+rqayzw+jFcQe3Vhap4bUMG
	gp39vo63t5Hce9ZXPdhVMdRLr2Pa5jLFq+ipKJVeVsSm6KPfLUKb8lXzd+dCMSzB
	A8kSXighHmEnzEln/dytbrDSstjfkCekhHzeiooM2lVl9fHA0AfDYEN1pqyqUD5+
	6S45cxzoiP+De70Mq3msDsykwsr1xf5RFwYbRXKy8OFzFBGv2AI5K3D5BFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8ckr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so58923376d6.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 01:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830004; x=1793434804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=EXcExY+/blJIMDdGAcamkDdxUcHZ8QW47OS5qnc5nWFj53OVICLCGQN9QE7tflVJsW
         oGD/kNaLGOLEeY+ZNA2CzwpMO7LRGqVNcKCZt8hMS8+c+joDx3n6Qc9L4G7/dkExzRCF
         nBi3Sjp4G/oADUqJO6lzYDTi5gtFvumAFa+s21P6QYL+O93DCaN0japyg/HU1gspjPNX
         EsRCwztZCTZHcZ2YWUlWKYmAJ0WJj/HhMcSjMNZcIX414jvIEf9jauOXNR2hlCtaFJId
         h/2QxFPYl/NtEmjhuRrxU7oDYX4R++aMApKxmIbQyE6ZPL1yIVTcI2/jDUB0aBDdY4vb
         ez4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830004; x=1793434804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWHL9All+sdwJ0hUqU7BiFkc4/4O6ToBHLVFYKZA+VA=;
        b=Ut3FO8QY1ea9otho5TKrk/ISWZfSxB9exJmUr65Mw5T82tAH/zLJ4Hb6/mDfstCnCV
         LtS68Uyb/YpUoWbet4ImzdyCeqWnU8y2jQHay5tXWM1HGvJmIRsvVH2PrdBmyGgLdBsF
         jnRqmd3+XtFFZx0qZCK7ZdGgHhecL5GiukNhTPwz0yK9WG5C45AuTORFJ5IgMxkv8nKW
         PD4hJ3/gdX7kXAjENHhgkx4P0GslSgzz7CoTVZOm1yPNufyqY23j8d7A1JiUoycUIbse
         hiG53Z1A91H1YANmFE5TcMAHi1AphEmRdjnMniNfw0wzv0tZJzv7J701tLo/8d6uzmCV
         GVTw==
X-Forwarded-Encrypted: i=1; AKwUvBwxX6Vc3pS8nwyhEH/3mLc/o3PKMxOLO5A4ssqdMUPy77Ruy53ydczabNfCFCGfFD4PgdbdHgrVn138oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRezUa5AQlijHn0fzzH2lj63YxvbUlnK+8O2+tyaQOTsicFFv
	XRieWOs0HfeZx+SDGJxj4AznAnwYTKU5pPRo+nfVBsHC75oVUokqQN0d7QBx9ZpMQPVZ3ueFyEB
	0eh7RTMvSK1EO0ZxF1x6zzLGR6tyXL+kfiBclEW69BVgk2QOONpnVifMOhqdn0KJbIg==
X-Gm-Gg: AYBFou0fqujmgOCi5oEN6x7fAZEAySMqBj6coURL4Hi/2aPYXTr7XntkmYiGu23qwn6
	UFH35hV5iLzWzlu4gGjA+nEX4aYa+guMGsITIXsYe+PRig0c83R1XWjpk0ABZXAYnWEA8rzh9AM
	rvCEwHE2dQ2nOfr7tqenbkF92+2w4dQnZg8P9EawZbGRzMXJWQHoXsdfb15v+6iLWqxiIVfhQWJ
	ocHvmuCOqmI/220O8FflKGSbhYiaiPxPRoEECEgJxxVCW8Xa/SlomJFcS/KytdLQLiI4NNQz0Tj
	imecBsGrhfCuN4aT4llfn3LRzbkuCae425mNGMISXvtlgIZH6vSp+gKw2zR8zxvILFdYcyfk6jc
	8nSX8o5BBGpQEVFfkXFnwfYAi
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166869785a.8.1792830004357;
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288e:b0:93e:618f:8127 with SMTP id af79cd13be357-940ef91e2eemr166867685a.8.1792830003898;
        Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Sat, 24 Oct 2026 11:19:58 +0300
Message-Id: <20261024081959.2887288-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com> <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
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
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc6a35 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=GIHIbdnDCuNUcvcnLtgA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: LkIoVo_cMcVAF1rTc-fERo1dS3NIwYwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX5/t2Ejiu7+bT
 6ayPNhH3gPuRhuaS/stpNyUBk1m8vRtOuqSvfdcaF9WTUvwlIhhVMuZZHbfM4aD8Qz4tFRohuKJ
 DIELWYDtvbk0sKZ0wSV4/k97FutrTebm4PzG1qjtCphbSIE9A/Ig7ZMIZNUaPWE1u82w4ed0sJO
 xge/bsYXcMYz8yIod9+ARvI4N8pnD/J1o2J5Ep1/Qs8njqKZ1PyP8CBSi+u/vG0NgGEbX55LxHM
 fHLqt9CTGZhO5vREfWoNQtRAOoLgokjhPXk/6pC1zcqM3FLiujomoY+60x1KqvatTcZyEaYtHLL
 X3JUIjVWJWm8eZAkIWebzRxJf+eB/oswWxqjXQAhBbW6XuLx3HGNEd+gZRBVPA1lC6tskEOBGNW
 xZ8soicNguHplHbczReRPunPCxTfTJE2ywTvHowzDbMS5cXJggMRjKZYij635GSIJkJh3zTsmbJ
 Hx/r+U8BNDu5pQfX0lQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXzW/WNL0lFYIK
 whAP6bAfvEX68MxeCMcwPOK+kpPaq6StCBnGKiLfE1RAJZB+rn1LTclJZ4TzQ+W+5e+tiJXAjfJ
 P0cf70eQ42sWtnS/hZyf2m5ShW0Apfk=
X-Proofpoint-GUID: LkIoVo_cMcVAF1rTc-fERo1dS3NIwYwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:32, Bryan O'Donoghue wrote:
> This sounds like it needs a Fixes: tag

Yes, I will add it in v2:

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")

Regards,
Atanas
