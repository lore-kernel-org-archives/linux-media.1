Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776991;
	b=DiqQYki6cgNJ0eIk8LD3eRsu7GJ/2U+WPQh9wsBKKzGPeRZOIQZIciylZsYoVqOmcZcm
	 6yvXwHCvJrQ6yYtWERFIXJC271XGPoTLr0gWvrhFcmXqzrCZp4xIIJg8kj3OGtZJXbCsh
	 nYPbIS7AQfK1C3AY0dRqc7cOyehuvFuryTqm15/Y/TqguNDQ0FzWwzslX3ervKtBdeMb3
	 6jCF7XCRQzAiPEcAvLZcl/jxdsoZu8rrTVikK88ACVfF5WePPAD66/czZ3YVsxJsy6/43
	 Nj+MQTIclH2mLHON4azFmb1MHh6ALFXzjxGvMs4KeALK0d6fil2374bsPTLhwpK3dkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
	b=GHNDGNIuubkvUg644QbmTggiN2QCexoM52uriapRQpI3mhsE1P0+YuCS5Rf6LUWPwCYj
	 7QydD/gjhsAc15LBSeUiWOoSTAJas+PpNN1SJuI0N9MjrAaZiA6xjoltsP5F3LBSSIMUd
	 SDklYJ9CF7qy2dlxWazGj0CJSxpz8hOU1kENfQOZxziPhOW/UjTOLQOKf9mPgmqD3TAMq
	 MHvwMPWHalM3Q85vtAbZO36l01paQUHJ+ri5HZB3Ju63h7MpyFdUAzO6uSlO3Sc7tieSP
	 IzwtjF+6HBntmHOs88mO1lMB6CaU18iTl0Jr5Z7wfc+NoID9HQ9aoWK4XgOrcseBwfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5D606A32C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C5D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAsNI83610396
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=; b=nxFWYs+hbj2oVrEG
	DjiO7+devEYg6Y0GUa8g9P6GUlJuqEV8JitG8WUQyqYsqp7C5DeQwg+YP8qUqPFg
	m8a5+VsIKUocm9xrF5cm9e1qXJAAGsmQC4NagCy0lnktbaDj70C0fuA2QpafWxtN
	j8wKbujzCjI9YcHtt2gvvoSGJmcdeASMXqCMRLzFng79Ekq1iD+wx72Ar6LTu0Yv
	S7oskl2VOIyqiY0BBl+sRAisP1RjEJxBTiyL9xIP0j1qAuFrO5pJYlha0H64khs8
	3N9CaSHL5wjXwbO4lPLxwlXYvyGr5ENMcaMctq4rxQn2Y3/cRIjXjpaZhD0f1z6u
	noZXFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh9a3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496156f74fso89044385a.2
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776989; x=1796381789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=fwd8xnlgMkfHaudynmDKzSndgVVYISR0kXA5SjCRodZrpSPJ+1ukeSEP942bGUHdSZ
         h2qjKRAV05rFyY9j0+hCwOGfddnPfRMaEbBSM8RXq+YwS68hS01vE23gtqFlmroO7+pa
         6RKWl+6chVWG4hXeAmCWh9lomTJ1mm3ZYcmFOI+d3/xsreUUamUtrFrAveDvD8XTLKST
         8VNfEx7s//OA8uMG7ZuZsJwAb6eVObcIDa2jfATeHTJKOLfmeklQAorjfNWQAVbQ8NvJ
         QMIv+GLNudGyXRPNE1x78xEI09tWVG13qXOQTeiXtP1C0wLgt9H7w+Gkor6r+eXBHNE7
         sI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776989; x=1796381789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=nJzulXkUe2i6cB4e18F7UQhTUiuDlO6+TE68pqErUSzI/ee+8qaHa1RvhdR3fWNXFp
         WyaeOoZlXywz6SLW2rWTS+GgGItbA/xNqWvPY6iUo644dXOyG0IDUjQ3Kh7UxIrof0bK
         EX7mD+KLpKD7RWuYllDvq2UW0hnOK32YN+WA/XcusBVz6gJTCXPHZQvYXKkK+NApr/kO
         h/qvOcQgY02HrRykyZBbu0tZVPT7ySiHg+KoEsROf69Uin1/4IH0N3mkpOpix2wbOgnw
         tfM47OUKoJOQzswulqmttPzrdmU+kdB+WUczxTvIriAen342Pkn7IYNTqazl3/G9Peeh
         mnTQ==
X-Gm-Message-State: APuU4Z8tzGqph7bfc54EWRf1Sz0UBspz5/lI97P8CTURgJv15vXwh/bI
	A2Ilg74I6wG9WY/U9Rseff/ofCSwXabdhfxlvhLKjfwqF5fu/OiV/DfLfKEK/V1a3MSz7TxJ/91
	VY378fKih2TnIu2K9HYxeENYFn9lQz30s9uxp42qOJVOvNPl7M97unak9zW3fgWjDHw==
X-Gm-Gg: AZFdTZdsfbjkowfpG1MRACAtSMStDZS5SbuM/4zMhLPIJqO9JoienHSbLzByOkVhJep
	FRaPR4mbQZv4B4CteEhKmC7qbzrl/sCfaE62Acg/WyYsq2KOy+PQWpxeGvvsTRbwfbWw/99qZsf
	takoDqHTkmsRlnNxLO8AiX+BdLnEokt16TNXHD0QNLQBDv19Hd/7pskHtBOC1ZmPVE6li9fSk3F
	Q+RteJy8RWX+bq7TT4GYnoe5LTStvwgTrFL9uBNKMoGTACEEeKs68hBGisoqge64m/3zkt0unLE
	Kx+mUhslATfdY6aWBEDAZfRojfhe1TpB2jzbV046LOl58wqLqWdCOt/r+5Cm0VuZyScPXLkPWLV
	khTDks21U+X2uIBHOghuK5gTvCMLkBBF6Qu4vguQTcpehViXIJNLV5kpzeVnDdZT1dRgJeUo=
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69442785a.3.1795776988627;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69439085a.3.1795776988148;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm4492470a12.6.2026.11.27.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:27 -0800 (PST)
Message-ID: <92f6d14f-1f81-4605-806d-57c13e30126d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:56:25 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX0hWyPpzLguVp
 pbHBrL+EHecm6DR1VEyUGr5zVGzTVW3MbR2UgkHZz2cDK1Xe323sZo+enu1yzOUfjqemXDPgKrU
 edLDe7rIyIc7nFe54rGmaOfXiZsc+L7tTRjmqOBZXcKCG+4JNsE2aYeQ8zmXUNPCzWeG+xPnID8
 LnQfZIRH5ffgJxmswQXsIr0lWrWcmGI7g0Fb2WnjxMZYmoISG1Savm5eOvPJ0+ALy8my7ywnWhe
 o6zZtPw0HWE8bjgvhIW6dJ9X/QqJVI9SgI8L/cdjRCY8qKDNIrCTneNI8MSEtRLeAeUY/Fqpce1
 7UKSebDoqWRivHm6dZutx2t+bLpSBYJ1Zf69swPa00trmlRIK0qdWHGmMr9WAVQSe+GRCu4LsCx
 QshTOLDwOOo2DyYoRG1Rq97aFg34EE6UMPf0MYVCbINd41fY83H4m6pPffu9JKiuKSAKqr1POoP
 1S5dlGbpPExtM1Z7N/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX4Rru+dhoi3Ih
 Iwf+/bkSaz7LRX/1p8kxOXfp5UgTAkHYbyOpMTzv2FNvWw9j4Nhx+Bot05BJCKWjw7WozGWkdDo
 1gGejTDla/+72LDQLRdrxi7LCiV/tyE=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b0961dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3aXJPGk6cDIRbk3RZP8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rKSB68gNlp_vkmyxlyEvAk9qHmDO_lJx
X-Proofpoint-ORIG-GUID: rKSB68gNlp_vkmyxlyEvAk9qHmDO_lJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270043

On 11/24/26 7:44 AM, Deepa Guthyappa Madivalara wrote:
> Add the iris video codec device node for the mahua SoC, overrriding the
> fields clocks, power-domains, resets and opp-table reflecting single core.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---

The glymur series is not yet merged and can't be because of
dependencies, so this patch can't be applied either

>  arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -150,6 +150,73 @@ &hsc_noc {
>  	compatible = "qcom,mahua-hscnoc";
>  };
>  
> +&iris {
> +	compatible = "qcom,mahua-iris";
> +	status = "okay";

This is stray



> +
> +	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +	clock-names = "core_iface", "core", "vcodec0_core",
> +		      "vcodec0_iface", "core_freerun",
> +		      "vcodec0_core_freerun";

Please match the style in the glymur submission

Konrad
> +
> +	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +			<&videocc VIDEO_CC_MVS0_GDSC>,
> +			<&rpmhpd RPMHPD_MXC>,
> +			<&rpmhpd RPMHPD_MMCX>;
> +	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +
> +	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
> +
> +	iris_opp_table: opp-table {

You need to delete-node on the Glymur table, otherwise this shadows over
that one

Konrad
