Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602A40B383
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822394; cv=none; b=A1mZebf7s2NkuiqaYotD/JpsUrzYDJUCf0/2z0EEInWRhFI9OnOIOue92jE7Gkv8b6HrW8DDRXeKJSAoAkv1Wd5SJRO4xoLyPTXZVTtSDCnf5j7qAYkuV4IHMxRgc3ZaVVoQMEca8bE8lrUQTkWDlsySJKAK8M58gqllhrgjGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822394; c=relaxed/simple;
	bh=NoqTc953wGUfCirDeH3SqH5nOnq9U+JWJtIMrbyMGAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILkDkxSV/98I9PtuIk756mHy60ky+yE5NyXliNaTjBxH8jpqBOapppTDFqYh2mC7ciGe65AQMVEx+BVYsCwV5ngjQFWv2+2DhPcrsdD3PYW+q2xvHkNdGmOBDD7o3JpZvKDMoHmYSH+TIJqwHJU5iWKvK8de5PUoNWPgkJnHAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEQp0xcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7VKq9mj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEQp0xcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7VKq9mj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nC6p1590619
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=; b=kEQp0xcloYmwQX4c
	kvEzpYrN1l5EVudiD7/Ekt1BdyifNskaaBNsuAayUDPXO09VfiZH3G9rkoNG/8nF
	W4/BwOAxCCgx3DbwpAchJG4MMTgpLsVPEbFPIPRLs2Cd0Rnf6XipGK9EutlPEc6V
	JIHMdAD8LSjmwjJfDtDtObrtEv2erqSfEgSdt0e7alfCGwS+PKE35UXxWJRKTloH
	pPJCM0IvNj4byRf/eUq5bFvN9q4FlvKbOO7lvX2ExBviaM+TU1onx7PIrbIURsdZ
	8/7ws8eoOAKm+tTQvmWPQoxGjl8N+jV0zu4N7hNqI8EQbch0h2TQuauam303UYl5
	ZjQcig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3gqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:26:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso41742485a.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822391; x=1783427191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=O7VKq9mjwAbhh8yxUfTxeJ8m/w+t22DsNy6X5A0luIr2gpm8nu70e+BNsur5RBMKj/
         C/r6rTTNqAzGRGwvzkpwDU8okBqFWnySSNUnxO+VG46iqPNxl1olhxzm7T66NR4gVo4A
         KoTprlHcIRggnTTEHkeStrUkSGKAGUxCtGdnAvB+1QbowB5/9Kb6OVNK41DzNFcRqVQ4
         cBmEMvXic1fKYoFEJnGDYnpbO0aAW5ggBqK6l/WqcTgyv/uLLru1F+VLvPyv90lA0LOw
         N7BA9KGZ7u8dgJLUiRsxy1HC5I3aBin1XGN2BJrGu4LHPtJxwDlzh2EcMaLrx7wq5PMe
         r9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822391; x=1783427191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em4j1rjfTFXHEN5Lun83H7ijLdbaGF+xPI/HxI4Nw7k=;
        b=YIu9qY/glKypUutfiUz1kLDKFjwbK8iFmULnaYmuO/obDlVmH1VxatZOGSf9gD7WOa
         +oUhlRYoKncEWffLErdEZ8SHUe/vfUd17jINmD2BrxBApM4wqzeUCQmtgbtbaRNYO4UB
         TRPXGiXtAsSZwbL8o0kAJCAkX845jO++ok8B5KUr8/pboEndFC0/xrsNeTiq8LKDIcdf
         eaF6sIwJrLYKC3V7p1/fpHff8KVCTXoCj7i/D9phjJcYwE4+5DYxJTyUNEZQ2Jdix0sE
         VI1ew7NrAXu94lVoBYFkXx5Xbp4AtTKJnkJ3hPKenY/b7w9Nfwy3/DabdUEsx4qExwH+
         Lk7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ogIVne41/QsfEZZCShTn9D/O20E7X5X5+mXRh/bv2taFTZ9QszMxuZWE6AgK4WCXlhbxCeoebNmrklQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLk4wCKG5dqHdUmPhycoysfrIXefjCH7G3jDIAhkiwLgKnlWAr
	AJ3EwpBXluZC4s57/iGluK1lMch8+TO78WZeWPJNwjyIWbpRDjHXBQG39wELR+0HJz8QN+XhZDp
	TXLpDvDGmXa4OXaJhdIDBwytV3tmcwhvtTN6Wow0LIAPjN24eE195vGG6bHwTBgm0Mg==
X-Gm-Gg: AfdE7cloNuBMiWBQOM9BPNoPkDs2cQepETNz9vXRs0sAiTjib4UOGu4xao/OC/8mAaz
	u39gzeqVBmdAwOHPNp4sc7ZUOsdP1n5E69jVXsclcn4YqdUeVmZBoCg5ekW67DvZHC42Pb+01id
	aKAz/qfrvX1/yhujWXwl8RgZ7SLdPQ3784UIBIsLsA5lAjDSVthRJjPWLBZ+r71Ld8cDrL7D47D
	EnsKO2aomYo/ct+NHEzL8ksgjuqLj03/x30RRy+31Y/nORi64xd/uCftQYc5zVHy+rNeR3dS6I1
	Rv47uBggZp7ouxUmz1yGAdedI6LE11Adsenxp/9+9LYlgw3ekblPv+ar0WkXSNNeqDZ1KXhw6Cn
	3vUDHsrFBA+9Gx8m06phCdap1p9BgEG7/syU=
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367985685a.7.1782822391296;
        Tue, 30 Jun 2026 05:26:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:920:798b:e290 with SMTP id af79cd13be357-92e62873bb7mr367979785a.7.1782822390742;
        Tue, 30 Jun 2026 05:26:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm116380066b.51.2026.06.30.05.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:26:29 -0700 (PDT)
Message-ID: <e372e66d-7df6-49f2-9530-0c61ad43a18e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/14] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX7snwTp2CHwdb
 VWW9OGIgm4xfBAF/HKwtZuah39P5ScW/MSEKhwjyqW+AWKNm/DjYY/7KnC1ZWTV31tD5W5fJZaR
 1RJKnX0bEC9soMPz3ioU9qAQlXcIJrM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNSBTYWx0ZWRfX48M7rCeq5r3/
 w0wLShreSxwI1oxiRB6z01Xs7tonE8URGi7yhfkn+eVkz05gImTM1rd9dsFi6eWu5VP4ExQzkj1
 ml6OupKuJF4oUFI2IGX2yvh6Z0IKtlAL5uoQUIbHSey4jD5PGb840jv3nySIwHM1hopbA0IVfxr
 +NKDkPVg2ebY/3L8rZOJVriULWROfwajx8Pp4JZsQh8KiH9yRiwBePI2XlcyUfLBlWiFbNKsAlK
 ErxdI+lvnCYQUVlxs01SjKGIkEJOGzw2JKqO0yXLTS0J/zK+dDDyBL+H6/s33vBMsbh+JV9H4L8
 XJPsTXTkIK9B80lD/9LxeU/j2Q+7LBus7I7SPRceHP/miYhQOIcAeZav+R8uCGbnPERuIm08KX5
 jm6jKGtVvUNGMWnmCOOhrQv4Mt5ZlI5O2+7jCrLfud5YBwOT/1fd6Nrm8rnJQvv+jtDzEC9mPDM
 U7v50a6ItOtlIgZEaeQ==
X-Proofpoint-ORIG-GUID: 4Kwjvl8H3f4ZmvMl0fcvj3zq1FuMv6zS
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b5f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TJYwRQMSshrBWr6rMVAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4Kwjvl8H3f4ZmvMl0fcvj3zq1FuMv6zS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300115

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  							     u32 pas_id,
>  							     phys_addr_t mem_phys,
>  							     size_t mem_size)
>  {
> -	struct qcom_scm_pas_context *ctx;
> +	struct qcom_pas_context *ctx;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -600,11 +569,12 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
>  	ctx->mem_phys = mem_phys;
>  	ctx->mem_size = mem_size;
>  
> -	return ctx;
> +	return (struct qcom_scm_pas_context *)ctx;

"please don't explode"

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

