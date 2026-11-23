Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413362;
	b=IxyThRqpMUZnoSECfWqD5sNoob6ZO9+iymWKqsK9S0n3WvTxBkNqm11PPMVFdrBhtbgC
	 mEWJqIWdcZ0CeJizByo5FBxe2VWO7Ttx3HOv1ueDk+IkSxImn2+vp8OlqtSNCtXqnIpJr
	 4lY1Nb14GeylKIj0oOCQMOJKUchG8ovbae0fxiFp5SkdKFE2fzKGzZ4TL8AmXAFWXL0bA
	 OtCY1sJ/3rNQzQenMo9NL6lTTzv0Dd4ATm+FtnD2k9N2zi/gOFpT/1if4V9sMXEuPNr0I
	 oMbiA9nqtjNbFeSM2kvZqYEF3rs1KYt9p1HcNW9CzC4/QmvKMFRotRXnASfgEOxobYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
	b=duNZWb6z6FncCsOrb12pSY0hpKNB6JmHdzEcRzpMGlmWQE2ciPGzxEofblFgxhkMK5X7
	 YQGqe60ca6yhaCjOgTkYq/NNdOKkDZA3qfTm9lnQ51mBFIXXzLGidQA30eC+03p+j0AIK
	 w3mt2G8jMnISsVEnieZGUwM3+gt9Bu4h5NKRjFJ3sulWa95BIoA6bluYxTP5CgToaGV86
	 OktaYI/aPftkcO4vvZ2rVHC5sBPNcK/eayaISHwpMl4XmwYFJLPqdGhpEFDwwCut9bwVO
	 7PDHyK2TCWYw2aKoGEjtW21K9N5KjWEVkpEn6lZHr5/rnwZX0THxDRYaXwC4jWnBuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430C606A32A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6430C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOE0gCfq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fzwss8ob
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN514bj864579
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=; b=eOE0gCfqpxyV5Qso
	NqjyiJlOEjj6QZP03opjEcqTIIF3/iUfHD23DRD7g5EN84ZeYG8I9c38ZB2x8hGs
	ybK+DOGS4oQ9XZwhNH3EtCCUjOc5Fi3pbbBGeaqwTP2GdaEAbiMkNuNYuBrVjLbx
	HnBoZkXB5KPipz7ZBrnSrWJkhXWg7RvBvZ7jAJwv/OMFUyK6JcrXIpKpDe6kidX3
	55XgWd6oaHPkRHQOOIYEJJyyDqpjJhuAXGG9QaACzBLFiMp184CSqS5O22hXfpnX
	VIVH4aeoVUrMBBgtQY6074VBR2Fyt0i1963xQiNoFGIEiOoyfV+n0NM+ob7CCoPw
	bgQfkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7wb1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 05:56:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f09a37f41dso3783235ad.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 21:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413360; x=1796018160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=fzwss8obbkxIFCEOKHiMc6eaZiNBCNNSrqlpvZi5UEPoPQcArnsdchO49GpiXFz73X
         +59TzXQMFbX9W5hDhzBnzCIfRAZxBwQUfbb0jMOVqxN5BW3+CPDN8qRP09pfWw0AXhvP
         3k0PI2od8zL575EVO7UMC+qfXQ94VKlG4daCPbTUuebx/leqbPDyaXCrt5YijDxW05P/
         6GM6Br0FS5Y3NPij9d9pJvT8lauNC5ob5P44vKy/5ussCPjBl0I8cTTZL3FDnkkadx1P
         l9of+InPcOLDTmrLSoV1oyjAI0S/yEkG7jrElIW/WNb9A5+1cr9REio93+GsKlSspFgK
         vQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413360; x=1796018160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5basTFPtiDVsIBK7tkiyX6tmMYMBDsQH8lQ+yyXIwfE=;
        b=A6DHTQDZSMmXHUG/3PMO/mrYzSylqosZqI2n+I8P6vvShNl0EWq9enAY6+iUaIaCto
         WDd+7mccCvmV50VArEALOmCRM13zYkmzAvyQZxJLMyvVmqfw9uePx8yCC7X92/D2ISPw
         poXghFYEPDilIjnUCM9y0Ns8laG//CDnQw9K+LMu0syhi8a7h8a0MN6Kj+q6d4cHE/n0
         QjpnMn4JRc3nej2wgxV0/P+n7M6uwb3lQhw30fztYvPjjnUP0QRgEPhq5jG3m/tsgMPL
         dnWtJVXy4vylWQP0CGOAz7QqfArVxBvwerqzJlMJL8w+VUzWWv3V1PMnaSSEoaRBT+nj
         89ew==
X-Forwarded-Encrypted: i=1; AL+hErFTHF6KW1XjlSnpqbScbZYximRUWoImQbNIcQAfrjXfeiWGVbxyeThQTKXEgvmoSpLQv7vBmT8+YtPwYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/uP8e9Ag7I71At/2y9o5/91Ko07HOx0DjVtV8z+dpBUTJtR0Ab
	AUtLC7OJtZ/wZ2JpC3RLC5cz7OUGLBxl0M8TgkW0N1U1d75npuHvguArmfzpjnpDXmRKZmwWeOO
	RxOGPHrHpRpCITI0n3RAx7ZMNbhJfxU6ta3MhGgcq8+oyeTbdV1CFv2FGqZyO0bK+qA==
X-Gm-Gg: AZFdTZdF17cAuECBk9GetGraBVsEXqMqP9u59cALm1TyUZMirgg6wxs8BM7j3Y93xvI
	qIWLZLmGeirMZCnBzGYubPcly3MsZtNxv+RD7t4qiZ9PxviRIei9J96CcGYAxVEOkQ5saD1+uvY
	lqCMUf2wAXnCYANmNAzf8O8k8B1E4Fq56tg5GVNU9GQZjMdUJ4osEJt7YxdZ/D5oJTUvMBAkoC9
	kP70zp2IuZKghcSJg/FpY+9SSxpSMKyqlzhp0u1Q7leEVhtVDGNGEe+4OckSw9HZZOEmfldozS1
	QQ8m07nHWlkltN6By0eDQBd4lmFsIdV8DGyDcpuyHINpDdDOIEsTmLPjZdxYG1CqCaDdktveHHB
	O/4l5O4wFCMpoOqhj5RXc6KhijEtrk2E3Vu/nw9iGv/K6YUwlBZeMKvCH+r+Xwat8aR6nnRCXvD
	IU7g==
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395645ad.8.1795413360127;
        Sun, 22 Nov 2026 21:56:00 -0800 (PST)
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr96395405ad.8.1795413359684;
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm45538685ad.65.2026.11.22.21.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:55:59 -0800 (PST)
Message-ID: <a643aca3-e1de-468c-96ad-d87745c40574@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:54 +0530
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
 <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03d571 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZqXg7yOw1P01-A-HOdwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX3kqtlq0x7p+S
 wK4N3o0w8H25OV9iJeo8kout6nMWW6okZ6U3nP0B2NNmdPqDdlydkRTzsVRqeueUahsBA4983Of
 nH0MDvvF+Y5GnYZ0o2r2ibcaTZM/GlE=
X-Proofpoint-GUID: 0YphDuLbw9h3Fb-6wN9TkR6obswliMQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX+PP3KQUdqe/N
 x5bgZ5QNkbSmSRDoelpSyhY58DZRGE7DTU93oSNvxo7knGfkcumYSNmXeZhwM8XClujrGAd/4B6
 rdrizAnJlCEvojosnPHszOTnfGbR1KixipR+Ir5dZbqfv/UxpnQMNmsgxFFprodu+UDfsJB2v1r
 oW56x3uskg9cxM8Sk9KKzS2XPnTGZaEudtPxRyBsvpBsAEpEDtTDHKiFk3eGiGuy6a1yvdhjUu7
 Aks46CQDBOArvYo5miPORc3bW/I9fOz4xYGnSLo9m5wJ15hp5MvkE7Ra7q+VVymZGORHuZVpps8
 jtbJXiX8GT9WhVIK467lp5P0Hs3JaqRJnWSylHraqcqg/aLMatMGsxdA5EfS4FnDilRCJUSqjd6
 HeBSMWECFcZTcWW7vvlDDv2dCdHLDLXl/bjI6/g3+LVkdebX/hgDbY7/SybREbUN3rEqQcqv23U
 locd72w4/1/PYutaN7Q==
X-Proofpoint-ORIG-GUID: 0YphDuLbw9h3Fb-6wN9TkR6obswliMQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 23-11-2026 07:16, Bryan O'Donoghue wrote:
>> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
>> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
>> X1E80100 CAMSS resources.
>>
>> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>
> 
> I mean this is a bit of a convoluted way of describing this.
> 
> You have one less CSIPHY Hamoa has four Glymur has three according to this patch.
> 
> => Fixes: tag
> => A commit log that says this
> 
> Talking about the ports doesn't really describe what this patch is doing.
Agreed, I will simplify the commit log and describe the actual resource
difference. I will also add the Fixes tag.

-- 
Regards,
Nihal Kumar Gupta

