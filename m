Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794725409;
	b=WFse4kkcL5LTF4P8VyvrDMVA4MV/0+esfSxVynCEX3tx4plu8xy3Qc12AgjZJhtlXWKo
	 yFJIjjlQ9ImbnYqvY/Q76bzl95/EgIj1gdnJCEOTyJDf1WpS3qYuOlnuD0WU/4TrK7vcP
	 1hchrLgnl3FlD9IaTANjbnQtmTZqrpKR5HxexiZpYrhauoJvE34coIjI36ciHgz7pI5Qi
	 hindDS007gVLb4dUHddIXKNA5AhRi9PBL09mJ0IQgEU5vzHZqnyhWVenpO5aEMFyUa73w
	 4fJdqELU0btD2qs9lAVGOdFDZge9288n+a2io7Gz/FhupbeuVIVmP6j3iwKsnRY89/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
	b=lfIAunDIF5c8FZurTrT+fx2qW0fxMYKmIQHI6ZlD6awZGCMn9oX47C43bLpGOABEZPxG
	 Q9WQSBILGgfhYzgWnawufBodMHWk6KXcykrCEAQWorDaiLAV6GGVQqVYGLjdHQJlgR0s6
	 pnPdxmRmHp3phXSTUEqvfyt2CKterSNTNq4pzmmVp0CwXA1MrRANmNRCRMYNRgCKTY43f
	 Bn/I9IiFKLZg8UNARgt5pNNYNJT4/YwL/MUicK+YK9v6Ta6Ouj3yCGlKavDZ8U3fvOc+C
	 SZtRhB5sfdK3oi62fCdg6EhInXBch2ACz8YHQA5TUV3mYTMTijtPbpZlrcR38vHVhpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD2606A323
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e46aqNi+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZVCeNmEt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF52fXU1299839
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 06:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=; b=e46aqNi+2m8qj2TI
	mP7W+9TWSufJ2gq2nnkmdklX5kA9OZkNI3GY5GPUO4UXJnLUtlexFO2s2qkxQPP5
	k3qyYg5J4hltqx4HN8r7lBGCfN2O9+2aSn6FCgzH84yCNZJ1N4CPpior9hNbSAlb
	IeTxVfDak6qnudDPm//6fAyos1oXzQUrJdeajC+wOVO8XNmVTpEX/2dJ1LEbQDRI
	ulEgpQ2y801Cplcy5BonEjQnHRKDNeTYuCQEuKtLfSPKWr5EeSQkJ8wok82EVCpM
	YR7o2p0ufoBQ9JRa7JYAnh4Qq3FQ0pI2chlh/15qWMEO9Ez4qjw0yWj2BJvkJzUH
	ZuFMDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwacg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 06:50:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so3789754eec.1
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 22:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794725407; x=1795330207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=ZVCeNmEt2quO6iOfqAJWXx62gfQTsa99PE5+B42FYFhZ+6IbnBq9swMhRfvQ9rYY+y
         jA83j1lUnSeIDmMLeW0tMftN/fba4Cb6kQ0g1bv1TTy01sBKiS9ByUC6MD6aU9VO9A82
         6AOkGCydVydaItfqqX6anmEISezd+2I7l3PtImVrCKJxFQJOUiHf+cJCI5lvmW8RgmA1
         Eyv/UhKZ6e44Uen6T+HxUO/LwqT2KRAvVtfEDAuvaHtgbXuiSqQUfyIsb9gVLI3N2omW
         3LbCiUMZaHbqWNLvvmLnZ8s9OhUWzGUlZO2URSY6m56NQVS/bdYRJ5Q4jeCQi7b9+sKb
         3Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725407; x=1795330207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R67sizKxdGIAtBE34WIZvdULNtMn96MLTYZQZLf4TU=;
        b=QaCG9MoLKShswQczT/ohU1bMd4RhCcaX+7S9hEtDlcdKM8goARzZ698NGzANzdrMko
         ucnwHSfPwsOsCllAHspUZprYb6vlMHKCFITAkRCC2Eh3bUwwUn3EBU/g8FbtlRB7Z8Tp
         Btj/OrL6c3XHIhtSeCeawW9Hh+rRznr+Jvk6/PcSayQXeJM0RRKfW2pW5fYOFbPus9Ig
         qxvx5RsjsF0SZ7AwRxG+IYJBAvq0wLzFFn7UE0h67jUGhRG8E/gvaF6OiOEedAnwyI7y
         1uOVBa3vm5H7RYMKE9lWuNA7jtgjyHIWNt/+ZfGWt53YXjlOZfG13dUhknEdwrpYyeyl
         eCMQ==
X-Forwarded-Encrypted: i=1; AL+hErGfszUy8Wd4sJvSRY+vkqBMsL/ASLFO+V/BKdfsRjHOAc7DBWOJQCNa/byFidUESRAC7l1V1qAybnA5wQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2M+KWBaw3PzQYlmUYxMM3CnvcMMHqHoXHlnQYwQ0ts9hKA/XN
	R8I1TPW5seC+F4eNsWT8U6QvqXxVInG5kgq4/Nje7B5NYMhGFBwYPuRwptORIf6eAbXUQbk07r4
	Wqeg6o7b/0dDc4ZK3TfrloHS9YpUcex/rHGWWwk6RgfTCVcxSMXnCRVwwzfgkrz+Ayg==
X-Gm-Gg: AYBFou1GNrRypF9DPg1XxbIYPpCRTxZIJMQYVSydQZgY62r43tLY7OjZRx9sOcuwSfW
	VJEgljCwfemBIBDglJalhvsMzm2xHXmJDXMpWU604y8ZcZQBwhd7R5fGW/hgLqjbtOMNdxCnOlL
	qDX/1M2eBVQ6SFAwnQ4tPm+rlnhz9IYM9xe2TZCXAVqWyUPb0JIk/MwBkteOmFiNMwAWsNl+tRx
	kZd8djvzcRKSe3JJm7ovDFGKmd8ixGs37IUDY9Rwc7klSLj4Eq+T/AZF1/1FW+tIu5X0MsiYfZ/
	MaCYwpnb4Dj6m0+S3kt3/M70LJpWa48DAdV2pC6k1FioL362Gm009HnPd4gXxlMGehvRqkoZcN9
	FunNCwqatEDCDzQOBabaycPnIbZLOKDt8Fp0Q+aDje4dxKYn3hv9jIUH1m7laQ8sm0e3axBrZcu
	BK
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149287eec.1.1794725407131;
        Sat, 14 Nov 2026 22:50:07 -0800 (PST)
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr10149264eec.1.1794725406608;
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm21907314eec.12.2026.11.14.22.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 22:50:06 -0800 (PST)
Message-ID: <a348ca35-eb03-423e-80f9-4a61a25439c9@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:19:58 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX84+IBknlfzGM
 N9ajEJX707Nq53yyovpEAdXPvP8AHhb+6eQ7oTftIstlTTa8ZPWdklfZ8JwekjMvvwZCVDgNy8L
 YJJ/LeHI9tROKeEIB7jSkoFDpl8UWvOnnipWiYRP56l7ELzeiZPxHfViGvn8rm/5gmm1clgEkYo
 7YhiE0WLmnf6gX/KQXusJrkXweQpDNU/vwoOChQhE0foOCd0szzggk+7zAKEYKEQh0/WAXsBszX
 66s+atMSUPCMcfXjKRK8kDRpFHumz81PB1kf6RU2Wa6I5z/BdpthvgjNO4SD+IScsOlYo0dqMkx
 gJqkMhirX/4Q05kUefur6vJNqK0P+tEcnmwhn2oFYjcXZgyFKs+4JFduPQb4vAAqo8bvXDzgDD3
 VPoTqrjRdpqhF0RGQYNNt8JHRvxKWe1AM/tdwdGsSLWvSRcMz7digOaRl3T5JSkDgwZeEroue7d
 StWu+4naXZ+PrYr6Dhw==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af9561f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9TA2UkIA_kddnzGnNAoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 5b0ngj6e3VeUqjObyTVFFm67kADg0UUY
X-Proofpoint-ORIG-GUID: 5b0ngj6e3VeUqjObyTVFFm67kADg0UUY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAyNiBTYWx0ZWRfX1pLAHX4TeC6t
 POHsCzXXYYyJlivnT9LNOJKl693FVEtz/VL0zcjkrj45EHEQB70A+j9pnHtD2Y8d6ueyV7z8tU8
 hZUsug2QMZaw0SAcYXqNPLZtvrbmK2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150026



On 13-11-2026 15:24, Loic Poulain wrote:
>> Limit the allowed ports to port@0 through port@2 and update the example
>> to use port@2 for the third CSI2 PHY connection.
> I know you put this in the cover letter but you should probably
> explain here why you think it's ok to break the backward
> compatibility.
> Even if the binding is recent and we don't have in-tree users yet, you
> may encounter pushback on this.

Sure, I will update the commit message as below next ver:

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding. There are no in-tree users of the old port@3 example yet.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

-- 
Regards,
Nihal Kumar Gupta

