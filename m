Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309933;
	b=2ZWT4EnGI3FOIsILM3g6q/VXH/KwizXspnnmDYMXT7fOX1/JA7asTdJ+TTCx4cC8SkG0
	 qoWoHadm16cTwGLX8lE79JUpPZ5RXLbrVrmJdRQY3jZ7Y10+lGVbx0F3F7FT4KFU6fL2c
	 2IW8PGOiXg8s6W/05z9CVdnEudPvXE0zbEWa9kvM1msLYNILjXkml9Asn0POUfUlzi+Fj
	 +EWYc4LY3Vb5/QM8QrXUJxXFNGK3tkQztvEc0bYttpdO1J7b2A/4f78GrGIucPzPHGJkn
	 nsE5hKv6XkdJOrp7cVstZOtFrbTZlx9zgiF/dylHHqP0PkvRZOXi4b1zteSDEBXq4ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
	b=FOoBzKNpys/JIhF5GwBsBMEDQTpf4f9PltzCs5EXYULqh4DO6p0PgkEw8EJgieVgZScc
	 2iw0KNU4i3kZiEGNb7F+8bp/XOcti+5agm00z+wLFQlby8WruMszvzdGiiiRjTtC4Kitr
	 p26kiNiw2BdrIyofcBBUQd4RsCBirWYZOBAme2WwtKj0mBJvKea/R/5w3lMUfqBTY0QAb
	 FHv0+honnGywhayIxLEDCreq0cPCDdUrWr1kzvnmzde8DIvbCdlPB4wGgooRPYeA2ZwOw
	 HHghcAueUCynEFtzc9zn1BmihnAbUsfKdh6LVuRjofTBr1p03nq154ALY+xQr3Fs+KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870760A3830
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7870760A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsVTADHc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWDHXQ7+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAB9xlY4186623
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=; b=SsVTADHcHBKzYavb
	nLGn+1vz37WypDtAQXwl9WLGZkVuoQ4m1NRqcSaxdHThnyYTnO0hVcmigznimkrC
	RBBSvTFukyiqAcq2iPekfLjEW47+v7j55zYxvWlTbjYTlnAmgH4RIsmrpCwOtz1E
	yg7YplOeUaClzVsIoGY4g6tPDU19Cavo4Wj+6RzgQXM6f/meoRHJEAefXIJUL0a8
	BSP7uwfY3ZX46ZIPVeAf1WN6DyxiQKxmUxe8SbjvUWDSs+RHPcX9rtLACiw4Q3bv
	lupQCnp2RpGoXvH7pMkjuX7GB6p6qAuKX6f1nHsa4rO3g/E3cz0tvqs5myKQ8cwi
	5nw72A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgk3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:25:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so3542056eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794309931; x=1794914731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=AWDHXQ7+lkQeHnXLSfs8jAiAlq9QzOGFG9K/KfEFyIZL9sbAxgjqymFR0SqlWk5QPw
         a2Ct0zfthtspI97wnZNxiQOig+ivpeUDpduHk20ZyXzdT17H3UnCQ/gbMvuvt5r23ImF
         GSSZ5JBHjHIPpT+yjzVIqd6HkJ4I64h5Id1L0GKobEzk5L4yWWhpZbP32TDisqlO8/35
         JpaC4bEniXPCptKwU0pvuxwyF6hGMmAx/Fn2cnyPUJ/io7RTzuvKOk5mJ4QqmMCjsM1+
         g7BGMi/CVzDv/l2eIu7j6AOpoxKl8VtP8vbbiEL9MBY65ZdodMespu2NLO7y/XpRzIfx
         wXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309931; x=1794914731;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rRn0vIVvyaA1qSueBAyNudw6eTRyVguZjtA8xYRe3w=;
        b=Q07RdxM/0jN8roL07bXpexrxYhq/YRZlgqLNSs2J8HVupgOvtaa9PygQBMRbZCZO66
         gpydJqcMcKqBVcJvT1S9tRjHbIt+JenES66O3LA9dWvdmkhWfTRVrsR9RrhEn9d0zjRX
         FYf8ft1iRoTAWxkMqiO353JN3zirHiwBMYFpG5+8g+12vGqWVhuRM50YOay5AbSHzOcn
         mFP5SnzXn5VysdfrfMJa3kni+rv+9kbzdZPhY6DofawD27ZABpIXVBQVcHSFLtetmgan
         wLXpnjZ0hQ6iBYwzS4Laik4EsvL6A74O0zuvuZl5nMukE3CKwiztwtChizQZSrE2222R
         GmcA==
X-Forwarded-Encrypted: i=1; AL+hErE8PP2HW8O63IAES6KZtrfgx35uk7t8Hs9uv0Pvn6oS1GiyXOxkZ0J0FwSU6RoWt7SeQ6mNIhxUzYBw1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qF2S0gQyBSm+6zotP9O6yReJ0KeICtj0CTarmmSfE350T4Ztu
	wOtm+7oYNt31YjDZDvd2f3aZ4FTd2lyR8oQMXTvBgY1iE54KxEjWlQGBtmPTFUy1K3YJinkU35c
	vZ7xC83qUZkAI/x9wAVwlKfpjM97DBWp3nDvb+QmICxk9jAMzCh0RnTyQpXs+hzilLQ==
X-Gm-Gg: AYBFou0EavjaFGPvsLW1xbMpBM59dQ8hkUyoGx15P9s4EFHg8gTU5PITM5D9Ipu6fNe
	a8I1j08fkX9QMJFxR8uGxrcSQpNl0wZkLSHoyQioqj7ASdjf15GujQHKTgXiMH0ZcCyrS0u8ss6
	av90P9FRj4jsDHzFZWSOjfWfBir0o67bKFaDYsN8THeIhjur/xwc3mVbDq1k+XNCkmiX535RRu+
	j7DJRwSanOarIrtA50/2bpw4W2UTkJF+OdXTXw/XK4CZbWDVhK9RdhuULo9G+0rE0p8+MfTsQh8
	5WuYkQBDc7NCGXQwsn7CbceaYMgbcTndqe13Z/8TOJv13oPM4JNFNFBwsIVt7ETs5B55d1uzbUI
	BI0csUsHdJ2oovLee3y89unFkE/RyIbKGMR2x8xpFcDRzyfiEODbRQA6YvCOmu+FN92Bl0APwTW
	x2
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806051eec.18.1794309930895;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
X-Received: by 2002:a05:693c:80cf:b0:36f:2677:fc09 with SMTP id 5a478bee46e88-37520217bddmr2806016eec.18.1794309930393;
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm11890587eec.29.2026.11.10.03.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:25:30 -0800 (PST)
Message-ID: <6f94633d-b134-4b1d-885b-13fea6334767@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 16:55:22 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
 <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
 <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Language: en-US
In-Reply-To: <20261110-friendly-chipmunk-of-variation-eef4cd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dy6tHpnoYSjWbwFboYZxyJmHMnmyptYK
X-Proofpoint-ORIG-GUID: Dy6tHpnoYSjWbwFboYZxyJmHMnmyptYK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX15KDZ+5sF9GE
 2WjdDXw3PRK7D+ek9d+Hkx3spA6aP/s3oWlE9zks4xZuKPc2BLcl7DUMY0pRNhg8FoAMZGan53x
 ZaL+suZsMpMis0bMEvI897AISHIGSMc=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af2ff2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FDn66hFibwGTVsjr8H0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX7HNofK9vDXa9
 2QBefb/zoeUEDZPRolkXoNTncjolIs11f89QcKxD27wX4D9sSC0LKOonQBN4VRZDEA0/Y3KBzRZ
 M9FUtimRYDLjq2K9jY7RFw3hv8zu3G4RuGD/9d0F7XBVbTfGxBQC6t2aOmXBGjcqe9NjtGDdCzd
 Y0yN/caQIkVZb5pO8WEopvTdT4nma+c4/25xsUMnyhYl2S/0y/r8YpHK2JVClCmLAqNIy2XJmGA
 K2iTWUgUMbuSovmJTQoODQDBTONbuAIMhMZh6+tCmrQYTHxoNY2YWRuLnTVf2nUheXZm2YhpO4O
 ssIRSokzpDoD8uaVpmCMl1EJHXzyDZBAqkqTQLlwXE9SROu48gCRQ4e6DFnERglS25m9PXTYoxF
 lCkacI9ivtm/CgdJjSJu5djbdP4E94IoQiN3iyFdc6wIh+6tXU0MYPqbXmQHnB4gaR1tAnQTsfN
 9wWjk0fLvcFbLaAHYQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100045



On 10-11-2026 14:53, Krzysztof Kozlowski wrote:
> How could my tag go back in time?
> 
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Who received the tag and what was happening with this patchset in
> between?

You are right, the trailer ordering in v4 is wrong.

Your Reviewed-by was received on-list for v3 and carried forward to v4, but I
placed the collected trailers in the wrong order.

I will fix the tag history/order in the next version, and use b4 trailers -u
to collect trailers properly going forward.

Sorry for the confusion.

-- 
Regards,
Nihal Kumar Gupta

