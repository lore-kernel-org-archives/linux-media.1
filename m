Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346BA34FF79
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709677; cv=none; b=M0MzEqsr23wh9578l81uANMG0aHh/fDMDVY4JMDtAp0TpKtp49WPMIT41EqGh3x6bKRPmcfES7aNOmRNMmP8UKw/Q5oA0EqOaKYBSdNamBViPiAFenRvI7KYU1ZteoCO+/lVxts8O8x1z/Wwr6vjThLsDwByjJB5NiPvv6lekBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709677; c=relaxed/simple;
	bh=Qq5Z9pdI3WCpDQKVL6vyoFgxWJ8z9w4v5ed7QbTfgYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSEX/cyOy+BEJuzsWteiF8vLtTsopNqzFhBz/FiaF6e053oNGZTaRiOsn7sLG6Ktl+7rIm6+lWLaZR7LJUE1rvZwH25UEK3cdfDw9nXCharZ3siN07e4+g20XFQiAMqB5VRKNff+p8Lp7dAIf4w5GdZczPEZ7z+z1KMEf9ujT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiUod8Q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8puf4WH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiUod8Q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8puf4WH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EWRN8086961
	for <linux-media@vger.kernel.org>; Sun, 6 Sep 2026 15:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=; b=RiUod8Q+hPKtNg6q
	lOXnR+TICE5yki5olBYNDrHWNCOtU3q/IZRU3XGjns/3X9fkyzBofWf31R74XR6U
	7QMBQQwzUHhPY7MHjhAz3qaN+xo/T8A2zKHop0jI2DZNmu/shOcxnZfWWqwOUM9i
	d/kc8sJ4vnTNrnOzjAZEEY1mfgKIztlmGi5jc4jjYyLFrL0NhHbieSDUKVe7eUor
	qLjEKRl7OJ1B4+nur1BLBCarGbTTb0qKFUde1V6T6F1RDkDFQA8K3agv6v1uS4jb
	dx2DKBHCStVhzqRtK0s2Lgly1iVNlOBKRE/vbXNjL12mVJAPt2dtHxzgzocQpRWo
	BguGGw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jbm6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 15:47:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2520525a12.0
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788709674; x=1789314474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=N8puf4WHvKZeOPFPPpMOLkJmF1ptBVZX43NUnAyqVTHxMHx4aLB3RB4jQhCAApLtWI
         UPfBffSVBs1NeGavyOckItqcvB7YVM6b69x2jfwi0ulx+L3NN0YNM2RRC7OoPlsn5u9p
         TfenzrdISMIxiA7GpGsY2OFWBcBel7YZq91lrnYKtTU5G1BfhHPHZXXK5Fb2HN8NRjQd
         zJLlFmm7eRdxJzlfH6CkdqI7bwtMab4Jqs0nbd9zCZMCGbdC9sL+IOvzutn4n0xEpupw
         foIYCDG39M7Lxk/+CFMrBZRBf7itb35ETyCT+FCCJKrnGYURzHJF0rhI3Xv7SopixA1A
         0VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709674; x=1789314474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJuqbRAfLeuaHG3fQFZPvjkD3eLgn2ZlqMYozAYdRbo=;
        b=ZG9XjePHBCF4VSLjG1wA4WAbSuPzKWqChhdupq1ljNEoMNN8whAEPDaOxbJ5krgK0w
         L2nhS1hK7amqhV9mcX6BmCO/y3iYvR3g5ERdblNEbLPJ6qamaHA7dnEGveHOAyS8Lpue
         IhjmojU6IJUp/7/KwjX1wez3R0ISIkXo0fuPjMsKA+TmMEkYNBkLSgXsitF0mQDQa4MJ
         WAvh88sGJHFKrgWgJlup5v99q+J4ZG+NP8jX2h88hN08EROIFkDLr7RkYLRz6BaJovjA
         e4xccD9ZrUT2d+Tpqmgi4zVjZ8TRGYmYl3f6WTdZ+F4iyvyy5F7jbruO7BhZnhK/rPiA
         zcLw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Nbweh+MlanSYHEo397X8olME9GR4wsGP5z8yOaBIV+/WVSSd7C03J5GJAKl36UCeugJCgsVpHLAY9w==@vger.kernel.org
X-Gm-Message-State: AFuF++naroWGDvGmE6smUu4QmpfZJA4y7kFrDC69a4A1DD1/d3DFgRrT
	cknUP9vPWKeBjgMJun4+bOxq1fOgngAsmQJtzPEhpM+IFaU6uoJTs/P/j6xkkTowXzOHV/jgKst
	nVgJ87QApd1kCjUaOUbTpr2dKqx2KO44tyZb5KK94x3yP5kZyB039qfBvs3N6nXAICQ==
X-Gm-Gg: AYBFou0Nzee/dBFub58VMMocIprytef3esI30/H1hz5dJ/ZGfiHK57zpMz3d8vyhX47
	eHhYU6d25KSAE3T5LF0R6p+Mgj+37Sr3edMzpdtlAptSTJXwpoap5BzxXR7CABh2hjeazXNZFzz
	KFjTc+I70X9XiQU77aXPW6EPotFso15WRxMohc9bfyZMmFK5pDzfvkBIMVRBN45giLpzhpI6EXW
	7kYpQD26GcU1yZZyRjCEJ6jLkRQJddGlnY0SQQ07sDlz3y0Cov9PbO/vf/W2+MTOp89wsnsmx7x
	BqoFjnjzFRFQ8X1NMIT3H7PaEmzgCJO99RDNZvV/5lrD3ssahUm+Ffm+etbx2ax96mrO3P7ejF3
	Ilvuy2ZmSKNZf7upLXQwR2PqhGApp
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362736637.8.1788709674500;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:8887:b0:3d3:3dca:f0a3 with SMTP id adf61e73a8af0-3da21418721mr21362685637.8.1788709674052;
        Sun, 06 Sep 2026 08:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm20951125eec.12.2026.09.06.08.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 08:47:53 -0700 (PDT)
Message-ID: <b0089142-45eb-4cf7-be6f-45c9889b3756@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 21:17:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8NPWtncxwLelsAhjD6y_E3wDxNNu2ahL
X-Proofpoint-ORIG-GUID: 8NPWtncxwLelsAhjD6y_E3wDxNNu2ahL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX0oBH84Wb1KK/
 9s0Iae5Rhq1tLN1vCLi/GZuVjqjAWPF+VctjNUJh/1WeiS/jAEhC2GxYG5xZLGTHCeKwFkwUrGM
 Sj0i9HoW8VjiSl8Ssii4diJSA0xnsLz/2BUVj28oPkwFEMoCZnaifb8GWNGzs282b3KclC3OxPw
 2EjyVv8GYcUfdD2VP4ataEiIC+ilcCTSCmW68aEbdlMhexKE/kkfpnkT3lxwjm6QnC+jYoyQbKK
 fz1slNIEvbdIfOsU7/ThfJvd6/Mof6NSCQhsk+/qkNtFDeE7BuO1vOCCmSp2ygytkwOTV00sLeY
 vH1RNEnRPBFQmO1EtAk5h6AvRQJeV0Ch5lb16ujR6qc/6luEow44esMEIUeggFiJseDsMVCwPYz
 v8lWWVRTMNfZ4tG9dO8+IWg79bgmishzfG8dh0ZJK25yMCWvPvL8X93rfeHgcqwjn16amrvzIvm
 k6gJdAuYIoJODstjWNg==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9d8b2b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zWu_p7zOJ7ruh_JjBGAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE3NiBTYWx0ZWRfX6HgQAuyX480b
 1OXa81YJBo9QBr7ngs33MBHLMZoXa2pbkalG8BRbvVqUwx62mtoD1mr7Acnx1b2GTHR33FchdEB
 CHu6HjGjWKV+bIGlERwlQP0lzTLy1hQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060176



On 06-09-2026 19:47, Bryan O'Donoghue wrote:
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
> 
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere.
> The PHY side code normalises the input data to register level meanings so,
> replicate that logic on the CSID side.
> 
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
> 
> Existing bindings are not affected.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>  				     struct fwnode_handle *ep,
> -				     struct camss_async_subdev *csd)
> +				     struct camss_async_subdev *csd,
> +				     u8 lane_base)
>  {
>  	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < lncfg->num_data; i++) {
> -		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
> +		u8 lane = mipi_csi2->data_lanes[i];
> +
> +		if (lane < lane_base || lane - lane_base >= lncfg->num_data) {
> +			dev_err(dev, "invalid data-lane %u\n", lane);
> +			return -EINVAL;
> +		}
> +
> +		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
>  		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
>  	}
>  
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	u8 lane_base = camss->legacy_phy ? 0 : 1;
>  	int ret;
>  
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>  			goto err_cleanup;
>  		}
>  
> -		ret = camss_parse_endpoint_node(dev, ep, csd);
> +		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
>  		if (ret < 0)
>  			goto err_cleanup;
>  	}
> 
Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD

---
Regards,
Nihal Kumar Gupta
