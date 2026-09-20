Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308EC347BA9
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888681; cv=none; b=J+AmVFHlNvWjSUQ7Qvr/FW/C9f6MKa7hQwwSBOzIlrxF6wrMu1Szv1pkX2mVivOcwxq3dEAIHOeKmEWb8eEkCaUxiBHZZ3rcmmO4t9qDTZ5ZebEQjzKoYRFCz5gGfI4nkctdXH9FO5Z5mhPvID0u6TrM9zH6/3unZi04AOPcafg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888681; c=relaxed/simple;
	bh=s7eAoytgHL78rL5A8ihXjUoEHb//2G369+9k9wxCR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpwU6IrSi3L1sRFhly3klpGvymsWqqD6RA0ujkqksWdEtP974Dv+0aJEckJlDrj4OrML5Vm/6qAErUpKRTz+Q3YJDK0mDeRkUMTtDuey4EVLXyTQcCxAmcuCyRTtydBKA4KcD1CfHP4I7BPHvdl1y9EwXjSCPY/rw8KeItkkFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WU9P4tMb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGixPr78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WU9P4tMb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGixPr78"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55Yig2097102
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 07:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tE12glMtnWbg3wZF5tpLsoGg
	lLX7WuJZscPmbfDKmso=; b=WU9P4tMbZtsjPwBqnTtYg/gEyRwOWM4ovuhTKM5C
	hYE7nPTDT2YSc3TN24gfOoP/6fPhHOIQwcnLIPelMRtW33CBpatctqVBLgdNnSEG
	1p2kS9QDBB6ZvGdD4ihmPr2KUhBeoeHW+rYMo+cV6miUH9E1REKMtKQyTzkKz37q
	7wXJWsnyzcBRDxE9OirUVfnnLYZ6GF7i0P0g2QqRnv4VCVMFwtOgPwRnEVETBe07
	lbdsYFQqLv1IXnLJYEw2DZ6HRt4YtsdtI9d1mjy86oX07aXVjSExegWjVi7oQdH5
	dAfaf4qFGre8SiLceL2B1lq490cxARolFO7w+2mpHYuSqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxthhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 07:17:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so2514180a91.2
        for <linux-media@vger.kernel.org>; Sun, 20 Sep 2026 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888676; x=1790493476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=SGixPr78MHpV4Sc6KmGS4eQNicvRumiO+rVPY21dFPHQYvlOyse934KZI7kCdDtGrq
         tpR57IIUUr7/Dyw+dHtU0tva71fEmx1QdCjNCbdHotawwIbvglea+X0qqK9AbOr+yf7B
         tmpX1JMhTyLltiZG6Wl9TjJ5nXeTOdeG5YqqAWZMTDT5xDTevb3KeQ/2sCiu49LfSdZ5
         WVDrOl1Loqp3rC7b1vEN/XC6DiMoQ7Ec1M+OmjrzCzdPx1D5YbGBoVXG9mn+Pf+rafjQ
         cn+KKSeCxCMz9JKtv0L974tsTMpCFnuW3WEDDP/eM2nfvbqcyLOdRFx0Ua5DHrZJ9jub
         FDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888676; x=1790493476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE12glMtnWbg3wZF5tpLsoGglLX7WuJZscPmbfDKmso=;
        b=aj5JPzH/47mm77AVFkz7385+/bsP6bGeG8ddR04A0F4GmtLBXm2ohG6aQvVDuXI+Dn
         7/oFPV9HqnPtkmx7mS2agnsjiZWI45ywhytqHPsFkMHOem2mdjNIX4J8nDkg+WEUAgSo
         zcUzj7ghB+SoFAtk3Xlhip0Vfh1b7qUmFFqz/3NTGYG1Vonc9PdJsyz2yMsnUvNg5VqG
         WHxR8YFH14lU9amwE2cVfjg9xJMaCv0SGS1oMQ7hWS/9Q3nyd6wstHLKGipoeZ9Jvjjh
         7z9KZf4ZWvBdRx4YfQtbR6/yFp8JFHJDaCBGwFO750pkdcpVfssDLUR2jR1wrFWom8aU
         p0cw==
X-Forwarded-Encrypted: i=1; AKwUvByt0f1zVoCi6A5hFsktcOzf9jpixPia92+few6Lno3Un46KyFe4MiVwp2OyWnKSyYQCfdeTf7DvGFotIw==@vger.kernel.org
X-Gm-Message-State: AFuF++kDNj3BwkCX9PTUfjMN3BMg2/bd8FhLIKJZ1K84llvvvl06mSVs
	8z/zigkP1ZZ1SIt6Cy0ObhcPDSbQ2b65UxNQHsaPhsyiXyCS71NVxncy+US33xqEVSKKp31wBvQ
	kXhibDpAE/zNCk++turVeJwYQm3RG3Mtif1xdUM4XSEMxftdyhuhF2ZJxjd9MSDnDVw==
X-Gm-Gg: AYBFou2bkMR5oa28iWvwY6u5RTgCVh/vZsnFbDtKIv87Diy2zMYyfkATemqi12MU504
	H21V9Zv9qoeEX/QewInXu/KSHP9fRI31eKBf3llx87lsyBw8RMT1AgPCH5qEXHQ6RBAHf78NIqg
	7k9bW5GcQido7N71PwcHx7a2VA4oifJxyO2Vi2MUTkb7mJF0DuiLgh+ophOJU5ZktK95hW6wKTv
	CIA+3HK5Z6KBLDpxVEXEXgBRYXUKaWE1Eub51OCgYl98SaPGqqVGKqjJp//zJMCOJG7PEwPeVxC
	30wn1DtWDuKrMb5uYkXBhqX9QLyOGwgzZ54hyoCz3KpuMTqx5t3graYq2mLmEaV59DAqCGrY4W1
	dnbU34SFicX/U9fOv5PlydY0089CpEhrwDjF9JwjfTA==
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928747a91.14.1789888676138;
        Sun, 20 Sep 2026 00:17:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:39e:35a0:9c0f with SMTP id 98e67ed59e1d1-39e54d18291mr11928706a91.14.1789888675373;
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm14226451c88.5.2026.09.20.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:17:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:17:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Message-ID: <aq-Ina0nVQTBTL0-@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf88a5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Uj4jyQ9UG6jGA3GiD8kA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX2TxMbg131aJV
 LoRnrtVzVaoXppfdwsLp4/i/0Odsid/VYyLxq2eJboQ2puswdR3KNJQlnDdlin5gFEQqzWrtj5F
 id6j+yj5AescG95FUf8cuQ8yaOsobN0=
X-Proofpoint-GUID: oV-m3mj19BAm_prXrfA4rXFclN1w6vVZ
X-Proofpoint-ORIG-GUID: oV-m3mj19BAm_prXrfA4rXFclN1w6vVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX/UfFsSpPKN9E
 k8orRju9rnbHv4fLsN3WsStd03ZY+I/zqHYFW0oTa0UWGkgyfp4x1gsJQgtYVHQqFL/ztqurD9+
 9WIJ6LkpDkzDdCfjQmTZiIBZ6Gn82wVyLiEzyeQYuyk5fUNa/XXBD/o63YpS9qTcAVSJKJGtXGW
 VB41J1uk5lZlcnDA7rLm/8wcmqBM11qDUhJqofv44tpHxGl0WsCMO7nOEx3r59OiFmrb1E4aFwd
 PbgPidncWKBGWX/TajKgyqdjovD0kKr7vjSoFDvtOFai0JdtEV8My3Ng804HvWj5niVyoKOYxox
 gVABo5+tlalFdTcflHQCDlbTzlxffnucL7HeQwg9pzysuLHd+wk0/SR8vWajIQtf2zaHn12FgfS
 kWzAtEfRPwHMQi4raNXiu5X7+bbCpXKHSRwWw7w32jYoedXet9S31K53bBJpRatBOOkKshQpRx0
 LuK9vFcAyjxWCF7ypvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1011 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

On Tue, Sep 15, 2026 at 05:34:14PM +0800, Wenmeng Liu wrote:
> The VFE on the Nord platform reuses the gen4 VFE driver but places its
> bus registers at a different base and does not implement the write
> master CGC override register. Add a VFE 900 variant to the gen4 driver
> to handle the different bus register base, the separate location of the
> test bus control register, and to skip the missing CGC override
> register.

Are you saying VFE 900 has no CGC override register? Hardware document
seems suggest there is TITAN_A_RT_0_IFE_0_CLC_BUS_WR_INPUT_IF_CGC_OVERRIDE
at bus-module + 0x08.

Shawn

> 
> In addition, the v900 ADDR_IMAGE register takes a full byte address
> rather than the 256-byte-unit encoding used by the gen4 baseline, and
> the full IFE write master client map places the RDI clients at index 28
> (the lite instances keep RDI0 at client 0).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

