Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305935;
	b=NbJe9LMpbvyrb/z8P78q8WnERkBfEv1c6KhEhXwB7qcv4UGXpIdvtqbY2kImoFaI6yEz
	 +zRd6PqkIEM/ENvQK0aC5A3xnAmMPUAYeu8lqB2bSyOa9RsX3FIbBToRLXcG4+dwN8Pnm
	 XI2NbXon0VzonAarDD9gAJ/HxlfoCqY2V99r0OvjmqbBe1dDgRXnGK03CHB/PSRQnuIRO
	 G/5Xm/EtnReHkVmbJyePi7j6o7HggjIWj3oKAN8Gqb1s2/qaDc8MLrR8xTY3PNWr1X76a
	 ARq5q6fUilYiZsQKjn+NUdv1JVFkTay7EZXf+MJ4igrg1zMX6n5Wj7yfVlv4INjcdrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
	b=EarP+hpOvpoR3OcXuAcHUOOF9lgQvBuSQfby6R7j3dWTncACw409Ov0bdsHQ8zz5XI+W
	 499mxmWw3GAIOOq9s4XGlJhgUPhiyUCj1eleCM1CApteOhun8BhLg1y3ILhVrziNaB2Ae
	 28dkbiNdpf9hkoWb9M9cUvAWoecipemyxbsnJAxy5J9b0FcLKUmspLQC6vZIv+7jYBPPL
	 bAf4qeYFs/kA0DwM2eeFyqgpp9yw/yQxFcGVkJa/NBEoJ13VxVOpMhtWmDWmzfpBTrNU2
	 /s+lXclRDqTIv2zPLQNoyYKydL4pzhdjGiklSpKcSopI4csIX6nf3WtRwagzTx7zVXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A56606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 10:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xgv2aIeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0hhAM2B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4BO1154995
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I/EFu7Fs/ar
	oypMjEq5BPl5EvpaGvb9lezW04r2LTCE=; b=Xgv2aIeX/aafN7Ei/rMWPqmcw8/
	1xTLyJHBiscFRwYSoOsDxc9RZeUw7seu03C1GVCqSyzLLgRqvzzVuBMaVgNOsaR4
	+A765VBXjklqNTRJPO54YRoR5LrFjdqGAwEmJt3ICm8H0yEAFKOlSYjhDiqCqumy
	IyfycVeSYxFxdTQAUI8ghyh19PeziFnYaWhejUdrSc276ZLEWAqimz37itX3B92t
	vzNe9J+labWkSN7nGVQvRUE1Li+QUcmm+U4IAiJ/3S7f5Q8y02cttfvq28uXTSYF
	hpPG1EWgvRQNQ7UxbDrheFwch+RaQtbtZkjAJkU+12DjRqp0dJCFThgEgMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49n2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 10:18:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso421500585a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794305933; x=1794910733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=H0hhAM2BSin6OoSYGbeHKUNAqzlObCheQ1XOkBXt5UGMORq7RJByImX54Wzwu/67x5
         tg0H0vCX/uuJFAd95L1ECdEWLniFt7G4NSkzed8/de3+zHBM37kFnVb7bnzj7a8V663M
         8klFjzOoJuoaLkEqn+Lkh470xDNoWU1I6JIO1brrlJS1rvtB53e5RLJG8fbP2oZQdh2w
         Sq017FP+GAgFJzcNFQPAvssfTfY2ttAqXCLsyfAxwydMEvEy+Qu8hVYPBocZ75dN9jJk
         u0ezET1LA2qfVN8McJpN9ZndQ3a/0Sfpr5DsHWt4PyQUUzjAOkiyeeieZNnUJmmf75km
         CdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305933; x=1794910733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/EFu7Fs/aroypMjEq5BPl5EvpaGvb9lezW04r2LTCE=;
        b=RNd6xpAkLlAgYC0gcNUYydnNcRGA4N698IfGTjU0z9qp21e5kDXITzmxLTtCOdWFru
         bD3iTQ1Y9Z6QwIPGv4PVBP9u9U7Z4onoKLAiM5/oX08gqdQrz45pnBb4r2XNGV3Bp6wT
         9UO2u3ZsuC4KPlru83j37TU3Nlf9MpVpXWkY8MDSLneGyIdHEY9MlM8YdIcc62lDEjL3
         UF9/Dyl38OLe0vMowt+qF2wfy/J5qk9CQugGSM70Ti5tSECuzf+BRMy8Cp+aiivmMLe/
         h2ItdWPjDfADX3SD+lPB1Jul0EELZNgFIA0PwtDIoja2vcnlMV6PwMcUvIvYEgfVOT+q
         9qdw==
X-Gm-Message-State: APuU4Z+/96QBqOVkTmyvnLfC986NGj6z5FMsvPOAQ3M5BwEC3NZ2QFjo
	2u00yGgf5+YfJt/+ciCZSpRKTGdH4QXIwk4cp1bDEqpD2pkwCCKtTrLvPA9QctZGGMlbLl7bWBo
	poZeJc5fhrgPytkGF2iCu3HEWq02Fw2vad2ql/tEnRtRk8hC4wIMVbNr7AS1oqk+23A==
X-Gm-Gg: AYBFou2JoZUa8cDUSCJ7SDXMGkmdXcH54wZURXEjy5OBBKVLKcRfMz835Q7/fpcX/SR
	SRjxfs/QoKvMBDmPBz1kefF58APuVj9eBYhdjemU8hSyJ3GtEUi03tQI/yqttyMLLl1X5updKUD
	On4qKdYAu3ex212Dfa33Nn3bWXjNXgh+H5urnI3cmJhr3KZcaRK8UDq1/ZZHKXxNLtud0P4DSJv
	HJMUlQZI9Ldc+XsY8eoyJlcx32KIVodF7E4d02v7e7xXSccXoKb+rOtu/wi+UprHx3UphFe1TTc
	/PBNLjamloCwAFs30cfPpPvqvHGjYilVkxWfch/IpP7iq5T9h1c9ovo2sXvm1QfHzQTbvOFehkV
	wGTvtzJYlna7c0K8R6tUznScfc8ZRMDsFt8hIUV4nBVZ6wPagmyzFPwinbX6WB1KXRb0A9LqY1w
	==
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334978985a.17.1794305933370;
        Tue, 10 Nov 2026 02:18:53 -0800 (PST)
X-Received: by 2002:a05:620a:4593:b0:93e:6c4f:bdf1 with SMTP id af79cd13be357-9479f2b062emr334976685a.17.1794305932853;
        Tue, 10 Nov 2026 02:18:52 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm63168165e9.4.2026.11.10.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:18:51 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v7 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Tue, 10 Nov 2026 12:18:49 +0200
Message-Id: <20261110101849.3768125-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106133143.GA2705755-robh@kernel.org>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com> <20261106082522.1448390-2-atanas.filipov@oss.qualcomm.com> <20261106133143.GA2705755-robh@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX9oMs38Skj4RR
 WnMdWOiC7+QAtBIh/w+RPS8v2IDjf56wLkrCbK5xxU7kaYhqideDR6vr5UC9dWGKbLSw2OyJx0e
 Tc7NnkLLbPm31SJ3cFW1a8X8iLeZNKA=
X-Proofpoint-ORIG-GUID: ODL2XbZtmpP65fdI_MWIC4kBaUas71vC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MCBTYWx0ZWRfX28RkoGFiz8c2
 qNl7zLAawS+5dTqXjrF3encdGddUN+ts1Rr1XpRemZ8c55xcPnAm/OaS46WecwnFDn+pbR9/u3G
 wYXIK0SU0YsvdPFEb3frgZ5O2+/sgrihnHh+Vwst6Z1WpffdIR8m7W1EEaQaAeFxk/jVjmnKJHq
 7odNgspqrh1G1ZOTmWGzWUvzZfXJxAmtoT9RkGWOfVo9BItu/Hl2aKUw8SHLru4klP2Z6M4/eEi
 nb7Uq0qUQUIGf9msAnJkR+4BM644ODWNG2rkKg2DX6v72nhMNNWXBWILB+pt5Izmwhze02cgCZ8
 dRPuVQUlpyrtkxFne49CehNZntU25T85odRxw26MhSRWi6neRzogUHtZcLt70WFVAF17aUqmbw2
 SAzU62pRhb8k7XydRHa5vdwAjgwB/WtGHJcHwQdjOGpB8G4u0WMSKpdk6eJmSV0k+sEGzq3fPC9
 /bcs5y+CtZA66sSQehw==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2ef8e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=cRrya0eItvTHvl-yL4UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ODL2XbZtmpP65fdI_MWIC4kBaUas71vC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100040

On Fri, Nov 06, 2026 at 07:31:43AM -0600, Rob Herring wrote:
>> +      - const: camnoc_axi
>> +      - const: camnoc_axi_src
>
> These 2 don't sound like clocks that are part of this block. And 'src'
> sounds like the parent clock? Use assigned-clocks for parent clocks (or
> just retrieve the parent from the clk api).

Right, camnoc_axi_src is the parent of camnoc_axi. I will drop it from
the binding in v8.

For the encoder, camnoc_axi alone would be enough, as its memory
traffic goes through the camera NoC. The problem is CAMSS: on SM8250
it sets the rate of camnoc_axi_src directly, and a rate range on
camnoc_axi does not limit that. So the driver keeps its minimum rate
on the parent. In v8 it gets the parent with clk_get_parent(), so DT
does not need the extra clock.

>> +      - const: core
>
> I would expect the main clock for the block to come first in the list,
> not last.

OK, I will move core to the first place in v8.

Thanks,
Atanas
