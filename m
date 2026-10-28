Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201173;
	b=UMES8Ixne0W7CwKqI8tfxxVfvGjhnltVIEbyYDr2qqUPIE2zpug3SKE5uiyRgT3ypcPs
	 rTfAQ5I6APJoENMgos4lNyiumX4KQsiaz50z/REwyqsmhE3/Eg2B4faQ8WeH5t4H9LyMZ
	 WfWquiajt8mleOQ4WgcszrVkcFvqbYYlha+tEQVQ0uwnNUPcA+u5wXLT5Up8a7dKami61
	 Hz1BjRms7dTNF2h52CxFPOAEVXDdCNl0weQaype9SDzCf9EkjCIkLkCFYA9tArnWkqnrL
	 LnU4+YQQLyUCnPF/3M5EZ0qGB2CYLEmJrcwencwDRbzanfRICTyooS+VFuoCinZ05pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
	b=4JVefpUNdBC5hn4jpkBXxUNF5BKR7YISB+6MViAuqEHJJ5RkTDmh1KRINI7LS+We6eTJ
	 j+tc0ltG237Z56wdbaUF/fSYodFYtaiiSUKumdvPfl3hLp7tchy8U4w5DEXYqbpGjsGWj
	 j9jdsOtMRsuPx6yyHJEt705iNGm6ftQ70kWSmOfVss221QsuCqp5ovl3insSaL+4n1PBL
	 maVUMWGHxyUmJ33R4FV8Zyns8LtYzzNbIW+QSgKWkkfJHZDCfNfH/692l1NnmeXTd+vHU
	 BKxk6fm9MOLog0cmFA3wPSvYWRvQzdmoAHu51t+9LriKrUGj+tcR1h0x6FJAmO8qSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F143606A32C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F143606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9v2v2542964
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ESuzb9mGlbzEuJZWgE2L7mHU
	Td2bVeRjU88sdK3aSnA=; b=EXjX8reHa2KNrA2LGI8s2Ahf2Zmow+agLi9E4cHO
	9SV4Hdv0i+oD5Of3hssDyyEstAdMoAgA5mjKHnx8YUDJ3cEqPt7i/gebjFn4XBoE
	FAIQxgdDD6lmld4RpgjjCpxMZaHxYCEHVSxkw2b+36caFYTqzp/GExzw2jLGKU0f
	ddiRRjxcWdps2X5q9Ifv1b8XMQSqo8f/VGbNIhsAS5QPL54bW0FHAT6u31afypPU
	IffH1eARpTAuMBefiU9pAQbTuXtGMHjzHDxQcf+V6Q6XiLDtt5buCFUlN1HT8nlY
	ipYh3awuU3XA9aQN0VPSxEKR2GCKm+rZThz9uawCEOZCUQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr2nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:26:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so591977241.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201171; x=1793805971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=bu7WQSQJES2mMKNAClM0Nw27F8A93BWaz8K0Bs0bfP+ONTyPBgAC1akxG5Xfb6O9Up
         9GuzgcHuZc2BoarYjOaJ7FFsbRYJzOoP+fMIctxn/iyc7b9W6DAD/auYgM0vKiQPy7jm
         Xn7u8KrKP2XQujoCd1pQoOVLWmcOn3UWvR4TgzowUCocsY4CmzywF3AvOZo3mQOz+IQz
         3w+sm76wh3lsrBVz2AoUIS1XEofx5HquYkxGUaBNpacM5QLs1PsxTPb+938wzIAdpH6E
         KkpSuKHqp5dilakPmAK7fQ5INVe6EZxtEXx/B3V3itPK+yY5t5KiwND/2MTjleEBu2bj
         MM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201171; x=1793805971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=IZ9A2r49RAp2n7XHt/5AIVozAhEgqk9CQVnZF9Gvb2H5wgrEUATH0QJv5fJwYy71/2
         N2cHdtShoXp0xzLKrVD2qqTpVOs14tifbZ2YGsRlCMevbee8tzEmReNdl9f4Brnd2nZQ
         9KRh/ND0s5BG9wK18IqYxqQr8Bf5ZDIfbifYAfFDoCwSL8k2/JCwyS9LVuaD+1lAex8z
         AgSQrTcyO4F+qG1sEKuVotzRhooNbrKHeiUr9cAD/IL09qx+4kJRL1NsuX6CekDL9kuS
         1K/KfbWNLGYqa6uUD/N54zsVcx8qg5B/3CnIiJ2xQIyJ70wHazXlzMohMIsOzxILvDoG
         0G7w==
X-Forwarded-Encrypted: i=1; AKwUvByr+ozLYFH2w2WR5Mva25WSXht/n4l4mN5wwT+O3UJbsMQWCmwdGpkFRP8BdCgo0uZeYR3rW1nt6aKHIg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJYOUePTR+ltCZkfkVn2ktDDKVQrT4WyhdBP9V5DfRyWIn5NUEV
	I1Rq39Hf2mVm1etmRuuOl4LxT32y5Shy1OAaHfluXrNKRsKLdyekc/GAPiU3N2scH4hjJu4mho2
	sDKMKRaUVE2luVCNvfTwkimH9VijddOWyAAWpTLn7d432GQuMiRPup0Q9T38QKSDgEQ==
X-Gm-Gg: AYBFou308om7JGokDw4We1Tz7/7eu00S6K6BZmwBndTJREvRI0Gr1tCFzbA/v51OxSA
	PbpmwsvCBjyV19YXtjh53Ir3YNQ8PEggLKjG7lsN6dlBKTnO13i+G1E60hUgv68OVdi5lPdSNYa
	LJ9e8Uf8IK2xkFsWmOIUBHNULQlbrgX7JkeRHGUW2JvXEO0HOPLf9Tq6iHZ3e+pI9hBriUx1CNz
	kjYn8h0SyPPNJVvRe5sLLEJO0PbbW/pMs915fDiliQH8Cavd5D4H1Ih7fSq41YpOVWkAD0JBj2u
	L1tdREuCsDmLSF/dCYTzRpjBkqXEI/x8vfCHbu9FF50zCbUUS0jPNC25fN9TnnBCrZ5z779y2/u
	9DCFW0cAAnM3WYZOY6KPzemNXOujhM+2KMamupAVIbGYs4UMdHPCqjeKIbavAqhMG+w==
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403695137.0.1793201170582;
        Wed, 28 Oct 2026 08:26:10 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403628137.0.1793201169882;
        Wed, 28 Oct 2026 08:26:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm83510445e9.10.2026.10.28.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:26:08 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:26:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
Message-ID: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9Lg7p9n2-1GatzKD2VafTRgN4WxW-V_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8gVASDoObHTR
 2hXILmIKUq6m6TBbdPISNXZW15/4big9ZMZqCbLyom+9jlE02V3/YM+SvNbnHSCRrvCImnqvyzH
 8VN2jGPD9J5EBP4SJeYl+FwadEMFHuqjFibC+KNUek4AHnPQIR4WQN+xXoqOE8TLlyezQVxr3fM
 8+c5Zvd2vJajHgW7I+DPJk84tm5HmEhgwRCzXl3wEuVii4WdPFbROdaJy+V1JvqqHPyMUW7Q1lP
 mR66+o4LoMoyqr/+8vQlpA1Per6LxRDUtXN9szXRPJ2ndZdQ+zFIs1DNeXOI/96a8dZ8i/0gxwo
 y36KctSVEppv11QsFr91m2fCq+/2HZG/WGcbN60PlEJ210vMqmv2Wy0GHtrHNXYx4XuMNLq4uvX
 boPUh15xhK+hk8l982OFig+GDifLh09PpcvN3aTdBj8DixsmxEONKgj8/xvdkCjuI614985aNTx
 QW2MO8n1dSZS5By8jcQ==
X-Proofpoint-GUID: 9Lg7p9n2-1GatzKD2VafTRgN4WxW-V_p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyDbxhb4S5Bee
 fDKn7OH73A6hWzoRkRMBAwbPGGtxylJkA+3elhIwQIO8iWfoF99ZIcq/vvp7b5cd7o3wo5n/aka
 GpzpBvGvmSUjcxAujMG+w/zpNBrJZS4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae21413 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f333AuverTXq-OlsU_MA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:37, Hangxiang Ma wrote:
> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
> driver, including the Kaanapali common status offset and power domain.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 8cd331cfb4b3..658a39463104 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>  	.genpds = x1e_genpds,
>  	.num_genpds = ARRAY_SIZE(x1e_genpds),
>  };
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.common_regs_offset = 0x1000,
> +		.common_status_offset = 0x138,
> +	},
> +	.supply_names = (const char **)x1e_supplies,
> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
> +	.clk_names = (const char **)x1e_clks,
> +	.num_clk = ARRAY_SIZE(x1e_clks),
> +	.genpds = x1e_genpds,
> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..aff9e66f0352 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>  	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },

Nit: Shouldn't we sort by compatible here?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
