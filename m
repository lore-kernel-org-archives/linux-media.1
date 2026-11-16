Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796760;
	b=U60BTI3cxdrSISK33SOqYzB/wduYxPmFk9QzMX8Z+PPm9ttTyXfrTUO89TRHfwLWE2OE
	 Vu1sVO/6vhUa959kaYyuSYp12/pgdXC2cda/sXeg61VnVCDCrlKh6HhNBO+O9pXqBJFak
	 MuJn3oAFFaB9Z6QzOA9jwdw4B20DTUYrKr1yhMTb/dAE6LA50aIkQdmDnj0lMzK+4D2Ok
	 ZWRYS4e97j5mbXtZ/5fKCP/jUfm69oULhYFkTSSBtnVsripq/1rfM2SJ5wztJ7Fa1Kfq+
	 2FAdFUEQW/iriakLi2Um1e9K4Ym/MmH6OBUJuy7lBLLK1JuWrBjylODn38r3PLYTH/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
	b=zP2Q3W3w9tZWRgwllPAmmRzQFI3LwDZo/3bXZJBD/srDu0QUXfOI+W/DaKDq8tZ3m6iz
	 JWy1Wjn22QDcynXGIqeWc2UzV8QOAX4rxw0y+b9XSTlQP82m+Lxl9lEed8Bfj/33ZqA2m
	 GmG3okcqFqpiqbanjA17/xiPF8Jpv+3bg/de9z1MBfYUAlYTZaIA2BtXp3NaZTT0svhN9
	 DXk8YD+czMDPPpfYuAMw3deBhrpAWzPSOuBMKRmJ1n5vHS/1bLvxBdBjtkaYIc2fGOzxB
	 Kug078xBLwGkyTksoOv2I2iVfmqZingUBDVY5HMPV/CGV5JC3aqlHTIkEkwxdwH+ANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8A606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE8A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLWKz2pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfQpKjhF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L79t2361924
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=; b=YLWKz2pH5QwPDe6W
	iem3B/1wBS7jDUWVIf/dQP57tMDzV0ZQ0FsCjVxQ58kQfNzmK8rCic+0V/Wce836
	a3zUO2XBuEJ9Hnboo6n81rpxC3roa+S3lIPhxCWFawqLInL64DU3Yz0qz56uiUiT
	h4nJmPvREgPVTand+c2hVc6lUi+Lz9/jH3F7TjtbXfznaj04D21X21tbAPYNk8Hv
	DJo/n38Vv885v6wAirHw7n5A9pImQz5Eb8QIGScgzEqi/hFEs7BnKCw/Vrqxq7yk
	KweXdaE0rp6tTW8CmeU0GF+BKHGP+o341A0V/UJvSgZu/nFKMiraNjN24L6jP+oo
	Xznwcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj44e2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:39:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so304080985a.0
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 18:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794796758; x=1795401558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=HfQpKjhFzghzd68+yCTcDiTZPumg2TRs08LAVA26xvRkrcKeQyVHR/w3eI88gRrfxB
         +G8Wt3BMEPzgvITc8Tny2ZE25y6D06Nlqj5nOELHZeM/kj6AFKoYWrHcz/EOxAT8hXXc
         ZgGxwXw5SEwGeIh5w7e/DUexkdpv5jNwZB4A+aXFgu4BHAxzpOwvvzKfYcJktkhTIVKg
         TGzCa5adYW9I+45oc9ScdiL4jTTIqAF7shbErwuz5g6bFcM328Tt+vwwJzyPfDCwM/3S
         BD7IQvF++Q/PqZsJGdDouiwUhCWzbYc0a1WmvKs1+Eq6hZ+xXtaojVj0kbt4c4FXlcft
         LocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796758; x=1795401558;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2MkkOjtOBMugVy6AnNn+LItc3X/brWtifolQLWYx2o=;
        b=bC1jkuo2j9KDDHIYDY3B5XzTs64M3JeL+ktei5sbro/SbROhHWWFaA0RO0ZWPboZf/
         CRVVPlPyXgbNSVk5G2q+JtyhicwLXCAuUs9Oahk4Em6lrgH6B9KxdFuPRYR8Z26fUE0C
         cp2OHk63/cwhUG6g2wbicHkat6T18OeHJMwYREoXD+VOaqQDBy02DoKPp1eWIn9DlJpL
         AkspiC7SyPMiahDkOsJKEPhF5cQg/dL9Iq4C28NEEC9lySvuW0ykEf+xbwLjvM8g5hLH
         Dcjh6bjrxCGn0IyzIHiVRCWBU+XbJXOUeGmq7jDxC9nMgz2NlfC2RN8NySmJFKRR5yNY
         h7FA==
X-Forwarded-Encrypted: i=1; AL+hErErtXzcnHzm3qj7us6KhoRAxkbndohntWHyNWvJ386eNfLOLURfXVvc2Au5DUTgsW45MwBLMWZg/xxnCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yPh3TTNw59BE1bkXEIKiJ0Y5QE1909GI2pSeEKTV7B60AG9Xo
	k2TXVeiv+dGmxGBaFdfKKMbHMATg8GZAe1U3GszTJnkw6TS/VI/hg0eNwHxPANOdETwhFxgmmBT
	gMiTCHaBVULAmOgvm2y4ymYdCohpmOddbHzfhAzqdUxiGXgaSyQJJXfuU1RDbnBwNSg==
X-Gm-Gg: AYBFou3OW7ODAZ0nNtkkvIWG7ziElFXazTjpJRuG6Njc4J+YiwWHhBuFy5zyYn9Vd/e
	kCnQ+VokrPK54yBfO47tj/NhoisBLQkROwCq7GqB8iuspei/qtDBAjykPVxjqWMlJurumRweYd+
	h+WOqgkdrfV/Lb4HcHloHNr9gzg5r9qltp09tge3knlB1aQCvJ7mbYXqXnF+XvKzBrI2+OoJpUb
	j2ozvi5OMDZ19yx0cztWl0zP6NW2heX4Rd0s6trt6esiM8Sfc0M2xe4Dh2pwaIljJxs3hWJVut/
	mWfKy5PcXnSDT7bO2HPZZuJLJQjPFS3hf/6O6m1J+LFJ6KVGAOvxvlE/SUUwMQhkMuQkuRnvcFf
	PD0hTBSNbtM87RaoPOrn1qOScuAcD2yz2q+oCtoRNuyLLuHfT14gLoz4bAQ4rmRmyvnyAMtCtMX
	cbikcNdV47arsLXgUGhlg+6l09WJqukpkI2Q==
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926216185a.21.1794796757707;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
X-Received: by 2002:a05:620a:ac18:b0:949:5c62:e785 with SMTP id af79cd13be357-9495c62e9bcmr926215085a.21.1794796757283;
        Sun, 15 Nov 2026 18:39:17 -0800 (PST)
Received: from [10.38.240.54] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ade7sm75767716d6.5.2026.11.15.18.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:39:16 -0800 (PST)
Message-ID: <12a1c1bf-df65-4ed9-8d36-23d89d5013cd@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:39:07 +0800
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
 <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX7F9bb4FqH3VQ
 pJI06C8Jah64KBCpAVvhkACdISNI3fphZEXmwS/F+qK9OTwxu8SmLeCR+cbID7ec7hFUlbrbhXi
 MFXr4LIMuIl/rrMWywUqPVHPPo7kfMI3dI+UbUm9tZXaHl2xpr70U7NflxoGEqM9Hg9fdIDQ+Lv
 2byl5gKgzARGC6SJKqh1l7KmHqOj/UgrIhSelzf1UdgmkfiD9RJqtrKe6/DbZijGMIj7dgYuMI+
 ciW06Rax1DwWiLz5cFqTBKGmbXwIgHAtWm7Nang2YskKbeC0LVZiR+CG4ZNhyeLOTmDZstrpDzm
 NLjybePzVHcs7WgZrQneia0ojyRZflS/RQ09UJPYTfhqJZ6LSklurA+6SckiLapKi5Q1rZUmwZ/
 T7PkJGUE8voxdk6VEheDxlP4N3bXNLeYj3k7D/5Zb2FWcm/DcD2l7efLHA+WPI57u48HwSMmUBv
 H2Y3OexlqbGzqNj8/DQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa6cd6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bVWuqmIr14v8cS7SW4QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KPphs4XT0Fn3L2JG2LTZQexOe541WvRg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMCBTYWx0ZWRfX9Xieivm7RrZE
 Gz4ifyJnRAQSW+wV7iTZp0P/0P8K3hUOJryQNhoDvCbolKtfd3t7+z69PQHyvFkB9HH4oBBGn7k
 hfkHyxrJi+67hb+8I0WLEJi8Eha13Xo=
X-Proofpoint-ORIG-GUID: KPphs4XT0Fn3L2JG2LTZQexOe541WvRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160010

Hi Bryan,

On 11/15/2026 8:05 PM, Bryan O'Donoghue wrote:
> On 14/11/2026 11:29, Wenmeng Liu wrote:
>> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
>> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
>> binding can instantiate the CSIPHY nodes as separate phy devices.
> 
> C-PHY, D-PHY and combo mode ?
> 
> It would be nice to get an accurate description.
> 

ACK. Will update in next version.

Thanks,
Wenmeng

>> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> 
> ---
> bod

