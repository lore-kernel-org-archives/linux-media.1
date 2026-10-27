Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116760;
	b=le7r2tIy+u2OetGzJbCRAQFburNj9PC5noLDM8ImeAS0uNQ81EGFDXXXxYm+NqNdwSOe
	 zjFDcT8jenM8aBOHr6Ydrvt93PisUzA69/+iDu7AXIFacR1TvWBhw8g0wk6TehEG6o2BQ
	 jTopNiuDWQHw9zy9J+L/NC6qhwhHKE5KpmBNFIegGmQz7+PmaeAMxdAX4nAygBDlaN7Wl
	 48+3iYM0iUMy89ABqi5kU7FnYMOwKthjY55fdD/UQNcuDdnMkbniTdomB27lJY2GLLWYC
	 XdJxxD8ZVWjRopypOyavSf8ml/S+6HXL03hi1VlXMfiLFIIXuo915Q7ua4dK7rBOApg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
	b=JYVMlD1VAVscbC6fVtAh8geGyaeJ4T609/b7HsIMCvnR9f8BL07UQsn1IKj+MwjDwU8K
	 5QMx/QssfP9QcalRlqty5E6LbESOdDf4akT9zT4fFqVa5vTB8LBAprq2UFUkKjx/9MDBH
	 gVDv5Jzu2IawM1yc9LLcnyY4pPR5wC76q1YJWojVHqpkMjw7t8gsTyBDyN9uzeQ2awVx+
	 SYlVRIqIHd7kZ99/Hks1/0cM7EvRHAQ7tYEUyJdzWc6ZpMMT3+aBG8imoVVstqjO35roj
	 wZCZDreGUQUl9f6TRBTWDiV1+RNUfAc0nQyQDXUwpwPvlMXn9ZD4Zx+hScIt7GSbauw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DJ/fLSvV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HLXVN8IG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2A7606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2A7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJ/fLSvV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HLXVN8IG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKweT3639451
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=; b=DJ/fLSvVDixTzxyr
	lhKnPF5a2zP/KnjzLh7Yd+DhvE2u2omuC00jIkW0HQSc9LliwxU54k9RyKU6Bx+X
	DE2DtIb6pU6UD022/Ez2UUo+x10rssW/zk/pIYyp/+rsh97IxLVTEcG7gbvWAuFm
	NERBLlZu72FhqP5sltVo+rPBY7nXApqFnysOAfYcHakBYsz9NETKTO/Gb/RS+qor
	25N2Ilteym8LkmynVKZCssGcI3HMeTkGqP1TwbWROqawGPB7a1vl6J2S7o1zi7qm
	4yGP1XOcNcO9e4BxY51qmcfO7PyER71cziPAtz6xO15jGhKM1BPki72g0Q9PjH5Y
	vbsSCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dbxp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 15:59:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so58694285a.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793116757; x=1793721557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=HLXVN8IGZyyWYVs8DF89ZpqO7bXMH5lW+vt9EH2LFDGxaTo/4EVye4H4QSQIF3uoH5
         FpeWGpE7rPfPzeKVX4dyLF4dTh40BuKJ6gNq/FD9O6XrSBqtFfzuK25DsipeMaB4vB1I
         M2i+gI89u+2DlLSobtfpA4XkNKW5aAaEiXF7RH2KWa/NBNwVaE7kTj7MrDRdwO9ABGb3
         8p0WmN/giJU/ocWDte1TtGjOjFbD3nxR9MbhFQWKGX9Rg9VyoNF9ViCYZ+OZV6TW4yAP
         Cmb/LRDmFntuX6JVhdPAjIBAquM1rsxHonv3hKMHNrAdvHgO/lIrq0dEuxuH5GWlZ0dk
         Z2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116757; x=1793721557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVG5HLVwpWxE9nW8/eLjRHyPEPuYiDQsgUR7ytuKres=;
        b=lgbVL+mADR/zmdNSy2PWHm7m1S8yd2LrYM60at6R0eKrPnJDn1Wz5kToWSWYYMF6/b
         gy65tRg+EgmOiBdd2zLw5Qxepx8YCy1mrZnTUf1X8Vr8qo7s3Cgdso2YOpSSAyvciOZK
         rINs5NDoS8gphwXI5PilQgqRUj2jcoFh6DrcKgWU+MEJ7MNzaP8+PDdIm0lhXSmGcoc8
         w4YGsIARdniBApETQiLF811JqUC4/9RlDteFcJrxSPolDSNv0UcGVHqKxjvqcvdAAQPQ
         PgGZ9zikT9Rt7Ja/u3OIECbpuwgwgWkdD12hNzK6j5Dvw4foy7VAUOWBM4Rp0hJNSc6t
         yE+w==
X-Forwarded-Encrypted: i=1; AKwUvByo52dVE4sfdnAldX5pP0+cPdPt9WxqFmqYeP3bmVsgFrtIUss0KFYNmt84WTFq8vocl27e2HgORF+jWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOYc83/Ct2JOTdWH0ADnWxFyjeGJT2+L1tmfUIK+a0B9WyjCXo
	BKIpXW4LerqPsvelysyVozEbYHFIrXZbNwj3RZCduFULbEG7IjkGtCqfwErLw5stKnhAQAf2r5T
	rB7jr1bU3TBgYshR13OBJxWMlLrKAY+TRCv+1ngq5uUPQIBrXHK2rgo9qdc4qKF8/3Q==
X-Gm-Gg: AYBFou1S1R+Rc+VE3rToahizW1nkra6CajJhuVwXXFuPw+y9XE1NdPeIBYzSjULL5Lf
	VvW/+sHAvRKFiTIBlH+bLnVV8Iq9fcLLFMauEYHyhBkdVAb5tpJAFj40kOEFFXFbuewgiFEjwIv
	wzQoeisQX+AXhSjEchg6g8NXD81oTzEMUmuM/3weH1u6WKMncj6rN31Pq9+t5FKTSQ7gx2uHct/
	vJUKwEg80lvgQOiaWGXmi+E+h4DXBdTNuUBoHnF+FB2HRLweEKF6711PEd3bniSNkIllJTeBjDw
	4LwnXFhXxsOwiTzVnJIM6KRBomv65Nyel5wPlBFI71Hs1OScddCcYD8P7fCGbGG07G3s6F/Pmo2
	DV0KfzcJPaoPgtoAk7YKfBg==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564199485a.5.1793116757564;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr1564194185a.5.1793116757056;
        Tue, 27 Oct 2026 08:59:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49807e07fsm148356a12.25.2026.10.27.08.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:59:16 -0700 (PDT)
Message-ID: <b35f912b-2067-4eee-bc83-25028ba51b8d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:59:14 +0100
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
Subject: Re: [PATCH v2 3/3] firmware: qcom: scm: Drop export of
 qcom_scm_mem_protect_video_var()
To: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261027-pas-video-v2-0-5b52bca5add6@oss.qualcomm.com>
 <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-pas-video-v2-3-5b52bca5add6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfX+Y/ISu8ObERD
 3UnKJ4WCELgL1wlMz8ilOpBBu/hrqu8PIPh8kHm1TFoMN5K8vNWJUyUfTaEmNXh6LGCyLShcBAB
 T33U8OXM/vcY9gwH+mvNgQ1jsM6ejjE=
X-Proofpoint-GUID: wWBG-uD0g7WYMkW89x8FMeyAk6r9j2mt
X-Proofpoint-ORIG-GUID: wWBG-uD0g7WYMkW89x8FMeyAk6r9j2mt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MyBTYWx0ZWRfXxnXjEmrngils
 WluooiWiFQChif5JLvJW78jRHASPXFW5BfnMTzx02Gd82S0F8oBDg2ROSDegt2rJr6pi6Qy9SF8
 xS04hvkWI1T6f9WJgqHJgO4nec0ThpC7E3XfU5gxtRmXTNciqypWGbffCbN4RY+cqbH65H7VXa9
 p0/Curgn29AHJ3tW+2ylQEGTjF3hP4juyL4wBSN0y+ZJF3XJKMKiiT2RccyJ8XJSjh+avK43XnK
 DuISlmYUQlqnrveiFLogtTx7+M7lbstFF6yfoEDDL62/bTFYPGcUgdo9F+pvyvZqWa8MvvhZJwv
 tmeZMeHez4t1b8f2ETxJV3lxZmNrihH3hdyzohIs1TFgkaVNSEQcR7+F1qFSdVVU4xJOa2gnCtI
 f8rJNu42uG6R7tGX7QgJt9Ox84dQxfa0ZPZrYn4YgZpQxqm1g/OPo8/gc1YzNaBr6Duua4f7jEF
 DoltxmEQbPCrJ63Nbew==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0ca56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YO-PTOiLJedIpx-aNNoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270063

On 10/27/26 1:39 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> All the users now go through the generic PAS API, so fold the SCM call
> into the SCM PAS backend op and drop the exported API along with its
> declaration.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
