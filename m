Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36B48165E
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711513; cv=none; b=DfP1LkjEeQQPyDb3eLoz3FsJuCQmRbhudbuI1aKEt57aIs7X2ffYQk68Xi91Ury7P1cJ0eYcvy6wIF2c/4ZGvzkonW2tZCBeFSKXp1RW0wQyNJCBguFWAVXhGkehJAGjhEcMu0Dxj6bZc+AuEDDOJVW+3y4QExkQSPAlQAq4Sfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711513; c=relaxed/simple;
	bh=IWHBXYLysnyStiHxRYu7KPLO099oW2ylr2y+fkvh8EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgL2gJgo+/EDrQWSLtUvgLkgUeQf7pwTHH8FZdu2dyvFu5PUyMlMtX46ljrDBUjjUqkAGAhcLVvbv8IENnuu2h79fo6nO9bFxUt7CgJxPnEpV0NaMY7cJMbxw4RW///omsEcr3lMVnzGRQh102NriQIhSSZXj9s38TGBF3a84SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgZyT81Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJGr+80k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgZyT81Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJGr+80k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xdVb123873
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=; b=pgZyT81Qv/peC72d
	h9M49H8pW3jOyHXeUVKrwDSekf6vxdbhIm6ndl4uEWWEojip5d4seUP7o63nXpek
	qsL9UPc2/Zl5dPcm6yYF68IzVUghL0Wt7LMWIhqYqdpw2/ulpkdsm4zFiWQFE4XT
	j56yS14iIesuWwIVlBs8G66eey3VyG2THvJ0QudZ1vzeizudMDykA0PH02NTiGDs
	0mVgYipoThnBaYdpJ1gjEcA1C9R216dqMa9+GEsx08xc870urBiM/idDohEkNgM5
	wxWBmMn5h8pNpGxQ+wyNjSHCRSHuLe5rUluU4KblKqjFeQhgVVR+W3MJJwA8ZA2q
	bpNhkw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4sa7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:11:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso2311627a12.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711509; x=1785316309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=;
        b=iJGr+80kJa23YEE/XEHP8eYX/rIs3o96QpLps9cnOI86os0U4kIYBIG8Ao3Yf7fAhS
         CeaKe6G4n1Q1A/PKsN5JrRw5kwJNeR+rYRDXjzwxH65DBgIZ/DAI/4MqWo9wXLaWab4e
         w4LUmMcR/0IK+Hbq4rOaPwqVmvlXaJHVEBWCzY7TxITrpWSR0ZosyrssuP9xM+7LPh64
         UcETPGQ8NGJazFfQRgZpqb7perCNUBwcVkTs5eXo+P3dChq0t8krzDEr+MSOCgIqqAH+
         HZ+4RtgzqZ9h4iaUR7OhD3OMAy1zVVUCOCJjx6ng/vUdjS6+AOGoF6cOPJcwtdYQC7Z1
         98zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711509; x=1785316309;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DTynYoEkJaL/tiK2wP9WPgWRD28pAfrWecZZ4NWTdo=;
        b=rvHFitIRQMN1p2ypD80aIb7b4fwndosB3D/gp/2TK01qyNnHsJ9lHVhvGX7B1Lyr6E
         ZRendn5zmi4k1trLu1fEpZh8XwizN8OjedBQ1nupAWJd+m6rmI5XZNReg5ucwCaDgv1c
         D6DwQiS8/IlNxafeq7GI9qFiPJDQBUIwSYYIFaxhuR39OPr9oA6EcUq499/ZH/nrLLKW
         qptkrJyb6Pq/CyTtuZ3q6LyWzwnam0/g3UVZfSClYgENBbirqDocollG0s8aJui0oyjN
         lyhOD158mBSLLneBF4WGtG7Pgtlh1UNgzbnYAv1H6hm+nn2e3Sv1k3QZ7jyXxG9qYK3U
         QUGA==
X-Forwarded-Encrypted: i=1; AHgh+RqPcfXQsFpbIfrceFrA1qf/Y/II7Og57dx/r9AX0Wlu++XSW7QcXz6PG0DpbgCNyPoPMmxR+ZS6P90UQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0IYrr46xOl/Nl2Z43V012epCSExO7n15aY5DpdPKDaYGHuMg
	uhUCqb/n0REgyxIOjJO8ZP6WNsQyQjs0ul6PhOR03ShyYqiuIHAAY7ljwv11lixCcPhcApOjmdA
	PiBJIqN3JQEFw2mhYlFuROg0H6Khv/S0ET5DEpd+DtovK74DQgrdsTDUIe5kbMc2ydw==
X-Gm-Gg: AR+sD12BUuACgv4+LGtD3tSMwPJ4I2BtDMmeiSGtmk8bEwCDPenNd69wREwvQClidBD
	ZfjeKHnD2wHwK6+pKI6JxtoVU6ivj77tq7M/ZQy7KVFeoaN7wgoId6JEY+ZkjXDTJnQjfYq8wk/
	GtKfSA0PmPY3Znm29SLHOdZkqRymHPpIN2PQKAklO8paZ8we9k/pVapOBkSmZDXQAFZO/AdzJmh
	yicKOGqgY2doyxx1GZ9fXSCNQ4ortr+vT/KrE64Jmmrzev7Z6tpmHWeua/VBDMBT8Wj9cia7/48
	XKZJ7xi9ydO4siOV8eHqIRHsI2GlAiANKqHkeKXZjy3JPW5W/orClWYUago/QSaVeblH/Iq34sT
	BfthJLPiJwsHHKzo1ckEx84l74Zg=
X-Received: by 2002:a05:6a21:828c:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c3ad7ac45dmr22496129637.25.1784711508847;
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:828c:b0:3c3:7e9c:e292 with SMTP id adf61e73a8af0-3c3ad7ac45dmr22496103637.25.1784711508356;
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18ba96sm798387a12.17.2026.07.22.02.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:11:48 -0700 (PDT)
Message-ID: <d91877e0-3b41-45c8-a9a6-6ef8456c3c13@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:11:42 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/8] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-4-c0b1c1167c5d@oss.qualcomm.com>
 <ZjDt97YCI6QX2gXf-F4lYaIj4po25RZtKf27ElBUOzGcXoPUf6mR9uSVb16GcrHYpJdCJg5Ee0IX6oJvQx1gFg==@protonmail.internalid>
 <2512aab8-fbde-4b95-8619-6c32d60ab500@oss.qualcomm.com>
 <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f5b9bf18-1bb9-48fd-8168-b5b82cac08db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u1_iXL-aB976FycNXasz8awJ41682nvs
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a608955 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bKUu_ElxWFkW26IasOMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfXxYysYF6TFDLc
 CCcyseMK7A8iN6Ox+l6N2u3pq1RcAxzsc/rnExT+skmBjjMjJcHT49EYBoOEmDLy30YO5Brp+Kz
 gCUAG1siUSsE3rxztj5eWWr8CuoTAQ5MchECxhGLdu89Jru42xqz3/nMa3a9FKAqFLIrDUZOtnQ
 ZqmerNXbUV4SVrUHV7uhN10XjDSn+6FXTLrlNUXazxhN2XwFza5hkfHe660ogPoDSes4zX+L6XT
 j6ic5/Wrn7f6Az1d85dCrCZoefZcYuyEjZnon5IO+IBYJf5/gy1dpCHidPfSuZ8RujulR19ibnj
 cH0BwF939ADQ1JJpwHYtK/k21U1BBkpqf9SBjDtM+Kph60q4BdPkTUeM9h9g95WXIalle9LkFlb
 SiDE/+NC+X3QjVwJSyz1iyfs6p8s0PVqlnko3iOj4f0TYCHKFqUtfh4bwlUD/4iNQrhjJ/QqpL3
 QykZXVLulNZq4PEgSCw==
X-Proofpoint-ORIG-GUID: u1_iXL-aB976FycNXasz8awJ41682nvs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NyBTYWx0ZWRfXy9wLR8JFCX7l
 z/+pu23I7NC9q0h6vyajmqYFu471eGcJeXbgPpGByVUAcYrnZfM2dz/cAKxXWGz8KdnZ1ETENgY
 B9Q9y2Gnxce33Hig83+JGxgqRjUVa14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220087

On 7/22/2026 4:07 PM, Bryan O'Donoghue wrote:
> On 22/07/2026 03:24, Hangxiang Ma wrote:
>> Hi Bryan, could you try to add this change into your PHY driver? This
>> macro format has existed in old arch. We once have such discussion on v5
>> thread.
>>
>> https://lore.kernel.org/all/bc6abd24- 
>> d56a-4fc0-89e9-8986e8d8b3b7@oss.qualcomm.com/
> 
> I'd be obliged if you could generate a patch I can include and mark you 
> as Co-Developed-by !?
> 
> ---
> bod

Sure. I think it makes sense to pick up this patch from the series 
directly now, especially since I need to post another revision anyway. I 
don’t have any concerns with that. If you have better way to handle 
this, please share your thought. Thanks a lot.

Best regards,
Hangxiang
