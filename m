Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787736;
	b=z8WXzqgeneS6OpeTqAfnabAXd1Ty4a9j1qZSb+4JLFxPrEhpOim8ezNlXCWW5b+RHUUh
	 Kzs6rWJgxd5PlNfbDmQ2b062MgVFR+cORkJ1Fk7zFpxJ/BIX7Z4/m1brfikuHLDuVz1me
	 1j6z+ukhtmhwaqwzxx9m6nVBryPZIgfZ4ka9Y2C3cJTEc/fPTmx6BdEFbPv9x7hPDYzVH
	 4boPN8SD17vB/tDmCBHzaYxqGZImHIw6ujLHKoBXLhc+BpdANDGRPOqcaocHNGNBnqj1K
	 dsoz2IqOmtU6Diew9RFLEpTL4+c5MYgQke6zrthxwDlRd2qzwH2VmOscN1eq8a2ib8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
	b=mX7EG1UJkqIIlOB0ywxnJdCvEAZLR18RQY/udhG8TPPEmVSOlan9/JIU9K2UhntLCUtO
	 MYk/DH4Hod5AqET+/Gkze57gaGWAp2QR8zTXaOvHxhaO8QaGMBYk0pXLZxIYG1egj6YV2
	 IGUQzt+gFJIIBgGYiWcmYeOTgtTu9St7lthE8M7xHXQZxtGL9xQCnRrCzZl9t/m4aGPq7
	 2JVEkd7CI4wMuHjW9w3XJmIVhBzR291q54tPll79WAlm+EFy9tLmIkjlcJsCnmd2wrQmh
	 nUhIDSgIgfZQs5PKgODL44DUD2SglcG0y+OeweZsYmv7XS0DDDENoWkBDfVb9MmEbGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCIsiBj1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRJmt72H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49C606A32C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC49C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fCIsiBj1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRJmt72H
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChNb52205321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=; b=fCIsiBj1dAFnx17q
	0e8g4pAsQFToDktVqgqG28sY150BG7zfC1/mAMWa/OfpcVsCKi8GWH4/UiNKE4R4
	d21XuPqo1OsnKNtfDnX4vhl+IqnMtPFHgTg5sRH/wwL3GHV6CVOJH3GDgFoU/zDs
	4KSuRCxK0OVGXPnkNjmVkZHL+t3fdtROE0B/WuenYTUKWfi31CDAF7bi3hmfHNkh
	cPr6dzwAo353SC+yxCt9P5XG/X1oVC9/RLvLdkFnaeuczxrKXz6RqbIZ5H6tNpqn
	A9q/GNLUdN4WWgum/VLcYT3GZKWxIsiqjPyEtGk/6/dOIqEonFIgEbYCeCCBES0g
	KsR2Ug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huama-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:55:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so7392454eec.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787734; x=1796392534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
        b=gRJmt72HW4N3xXsOyjnqc4tAn0wZKKReRN9M2WZ8acOtS/+cwoy+QHx4NFOgluGCkd
         agov2uhR1sOfmn3mdV6xThnQWZ4WC/qx0sgmHCWSf1u6x+1SKC9bTffoiAVRxbMjDC/N
         6MGN59hW3B+g5VBV9C0FInIgfASsEp4gcLjCrDSOk19Xxm+sUyOAMPHmYxBqq3eDTvFA
         f6T/soT6t1JWW6a5aOwzwBzBIMF1gF9sRgkgTroqCNA/N9hYQZ5lOpUFyjXqJPiH+1Sp
         O7nGgpDVEx+5accm/PpN0XDm1IGfFwXJJWYCwOwdgF3SQxIJvN5dThDnfdMxyNBYTwf9
         avSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787734; x=1796392534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xGIJ8DGOyu2gbCTh1FSGJE7fE4QKip4VB8iOYWUKQI=;
        b=RoyGf14IXcOXxpWxr4ZVa7H5q5Vl6k9f5uVEB9/aA77SmznkGewaTPPzsLjgr42YEu
         p8ad8PLdEqTY1RqjEQksyHD+Gp+O/1bQRrN0etITO7ukARNH3VWyXsdrfdDFneWK18pA
         PAUdWiggz/xX4COKswL+dimtuPG5k4IUsNSgjKri0HkoH3TXH0Tec2HbbR6NbkbivoEi
         6xoz/6ZfLFmdV8gKGjlnzAbSfx24OPKc6bUrw5O2rE2++4EWZGTJMLmaJmBn7YEv38IG
         tqcu+BBKVhlFTKzyZfIpmA1czq97BlKx7zlYkOxPY2wknlTw7a49fanjkq06AVx9BAb1
         vmlQ==
X-Forwarded-Encrypted: i=1; AL+hErHyJtS6Os1pTCCR3Xg74AECMQHsK3H8Keb1PtNdIqZAxJbZpijLvZofkXsrz4W0IsZu29Zv8wVkgeZKpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zMx3LAmPhJgshRXKZmSXmv5PyexUmB28xFmU3N1PVjGnvI2SV
	+PEiHu3EH+/yi5O3+gzyv/LqAIovMTl4id5Q/x++RJSyhXfN9OJisAuA3tGncNJ/oSXPdl84jyJ
	u+74hetj61q9jJtUPMpiegomXIiOXntV8DAfD8CgGRiN8D3KOQNjoHrlTJv6HYfzD1Q==
X-Gm-Gg: AZFdTZc99hQJ+RRxgKDqSwFqZX+QTpop0Y+P8nU8V2A5Vjw7uhgSdabNATTzo8ew2vl
	erPAp911EGXWR4zg3LY+4DO2QoHYNlGzzZgVMV+fQeTa66HMjR5QDnp6cRUs4/Nl3Q+6la+vV6x
	QEaekCRG84QjK6xZWfbPD8EKboKnVqBqVeI0Xoc/nV8EEv0UgX1wpGrVF8eSi54XxWr+XPEbRLo
	13WoFHYSmcYauujiubwfQ9ISxsoFmn/XeasdyrW2+nbAKWrEms1z4O7bJWiMVhkYCx8iQuvHexD
	6LdYKie8vi0AxniiJETDRTLYgBrvIUj0oB8LmGqoRZ/uWo9Po3Qj8aHEVOB03eM3NqQ6y749jq+
	Co94GyBmW1Iv18hY5KOolkRZI8xt15Biua+2Bg5YqZySQpzkfk3ax+oS80Ix4a4yx/+rTVsKkYM
	4z0HbQ
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr15267644eec.13.1795787734052;
        Fri, 27 Nov 2026 05:55:34 -0800 (PST)
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr15267622eec.13.1795787733548;
        Fri, 27 Nov 2026 05:55:33 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm32534281eec.17.2026.11.27.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:55:33 -0800 (PST)
Message-ID: <fdb8d9d2-3478-4257-8a61-1e8de6274352@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:25:25 +0530
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
Subject: Re: [PATCH v3 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfXxCBjzwGDxUtB
 Fb3BrydRcvvE76aBNlzRIffjRD8ZHOhzGlJFr7/sc418BearEyRTZMS29KjSdBpm//2XywzWuUB
 cZeuUJpGiVCYB/Wr5jKlN6k0aBXF/Kc=
X-Proofpoint-GUID: Mx_ZhxT6RMWxXhzNFPIuLb3TTk854BMi
X-Proofpoint-ORIG-GUID: Mx_ZhxT6RMWxXhzNFPIuLb3TTk854BMi
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b098bd6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O1gZ55P4O49W-73hC6wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX3ZgtwyoXjozt
 0OqHePgF7w6g/TTIZAdXx/LJkykW6aFDtO48m9+bxUYut5qluv6AfbCB3e2WB7JXYP62RhglNec
 oF9OqJKYCokVCY2uCpHFsutreug6d+ae+fM7m9LNRthzMRVRJQV0lxyBCIQtS4CSEEpPYPUbJkZ
 pQoi/uh+QaJXdVzVxTgGQx0OLRtSXwJRCptFPKFU8oGwfTvrSw2r2AOerMdzhy7gJWoMsBhKQC6
 jUzBqHtthD/6T3lBZ/ODm8zXKBmmHX5wBldcyce+HxXFfeBKgF55WVoPlRUYyJmIspAj+66Gu2/
 SPP4qvnopHoqiUsPl1VdcJ/3diWNI20GDDuz48p17GfVDHhumDdIDxBLhu77EEh7MU0qOeoIbBv
 49DjhomCH0PUNkAvETSDt0AC2O0wPSKSs8VOkKgZAFxYYLZZ38SY9cp8RkCcDxRUnDSYwmHu9xV
 0Pa//Y7sP/nXBkpZnQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> iris_vpu_power_off() is always called with core->lock held. Its callers
> are core init, core deinit and the runtime PM suspend and resume
> callbacks, and each of them takes core->lock before calling it.
> 
> The threaded IRQ handler also requires core->lock to proceed. If the
> handler is woken and queued around the same time power-off is entered,
> it cannot acquire core->lock because it is held by the power-off caller.
> disable_irq() waits for the handler to complete, resulting in a
> deadlock.
> 
> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
