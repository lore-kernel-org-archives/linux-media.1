Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16965476CE0
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325137; cv=none; b=i56u8zvW7aFk3zo0S7quYM77OhfrAx2iFcAUTmjuwGfflgZBcYkp1hXwcER2KKuW0w85H/cGI6e5fxPmagVTVTisXTCacu052zqlFkHmeFEo4Zz+HgQNeSEtgWEboxAAlZoylVDVj+yxC+RXAyvJHGMo7hwlj7wd97TSl6cbn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325137; c=relaxed/simple;
	bh=+bl7W/DghJ2lNo8ihHQByUSlt3smL+/7HO/f5BD68Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu3QIEHzYAVVX02H5EgrfC3aQBe380rBWg54JQ2Yd+8AI7HQIRkBwxpyI7ds4EoLfbXP+GSPrLIXibm7PApDgXmA1Rz+y4UQr+64cEpvuyHO9dNSSseE4gcyyePBiAX3o8hRBTHvenPBR5Fd3io1+dH/HCMvpI9ZDRZvN2OrjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nejlkA2+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nejlkA2+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1309467f8f.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325133; x=1785929933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=nejlkA2+NzyvGg8tmcTtdNPOQ6J5qEh5WK1TNnNPzsC59uemIEyg3wx/1Gt6LQqKkA
         XbDmwtSrZCz/ASbPdQVAGpH3nJS5kN6K201Vfuh7w1xBbjOOrtGLa1siIui6KVneDaRx
         GWzy4tZobZ8wg47hoEu7QXdAinREusNW1rNZI6oj6Sg4Pz3W9ZelMjdSOXU9pATnJHqP
         Yoml7SIRAX/y5jPEyxytHNrvxfCODisa1A1DARKRBDNlcJ4/SYhNsaooM7E/23Chbta2
         rj47ZtnFpDUUfZ4N5Yw3GtpQ5hUmYj9QhC5CoXEZU7nx2rvn3JiEEjOY5rfWOKWLf5ol
         UJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325133; x=1785929933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=CjRPenma8VQefPiwv5RivXokDFf0pt/4lAXxCNrX5oXlsolCJAfe2duX1e1dog+T7e
         yj8Pszuz/8zZS/+28i1oQbxEq2R7Zz89Q+0RYcjbMW4Z2Nuy23CQIOcsBcRBqKUEgj3p
         netZ3HEfqob6SVaziDiBOCKR9NWOOskELdr1Q40/JeRq9m2xgdLonh4czDPd+hwVT3za
         FOD8IUKhKj5GUNYLtxaYk8a8ADa2X2ImM8adXnXY5mlQXyJ2bLS6jHKAUSDlhRwm1exN
         +u9U8K9X4UKdS0yTFs6nNbw4yB4vr3yj5k8fgLNExpWgAQSPzloJjXJ0nPruYS6loNyb
         EDog==
X-Forwarded-Encrypted: i=1; AHgh+RoI0/8mmSLpfFxg7x5t5oJ8Yq+FZKK2lnYNrIif+XBhTgHsMvGFzk4DvGqULUgUfsSfaaARBFMZYRGOeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjqdCgWZBSZeuJ26lEe4qczdXGDWB07VyE1di36hzgu1IYEQs
	j7psMqMBK56DyKAyUqMX29ZwWFJrGi9DiLtazUBa80YuUxtlQ4f7JiIli4TKjLKLVsM=
X-Gm-Gg: AR+sD13ZjX6ACaeUa2Q6avkRb/b49jHgColCT121Bewu4E1KOMcpxiJ+wE9e9v7rnnh
	IAZXBdokVGm+0PLW5XH3A6ZhKnMo9dHIWl6Lpx4QpwLNyquQ8s1oNWaqc4varsOJ1pDpji23hTS
	XqKjFhJa+4WM7eBWPT1ipOFnnuwzB1e2C2kmY7G4oF7vL7PcZ23q4Htw1FgWkcE1rqRDNxAXtgt
	NEay0unprMpI6dl1KqBZzhjfcPbd1UFySDfYEH9nHnTGRc1jwrXsdPjTwvnpgpgSg0afgZoc0Wa
	B5IAxCmN2nsbgICxrHLTSZjjyjZrtWoQ7sgNkIrzSaYKmIDeic0b5CGct+PFXwsWJJBoIAwYbZC
	aSNdiHYkHFH3SYERqVvX9WDhy2Koh8VramG3bcHTd600RNRHs7sqsxWxW4FiPuJJE1fFOJXpztH
	z77Rbcgx8dDatsZKqOm18rt8SqFL3t4h82GOxytpHSJrVZiUBrsmPKNVg862xk762n2KOF3jU=
X-Received: by 2002:a05:6000:2c05:b0:47f:9763:9864 with SMTP id ffacd0b85a97d-47fbabee850mr2432854f8f.19.1785325133163;
        Wed, 29 Jul 2026 04:38:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7702125f8f.18.2026.07.29.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:38:52 -0700 (PDT)
Message-ID: <f77aab11-0e1b-4962-9d53-0bb2fcd6486a@linaro.org>
Date: Wed, 29 Jul 2026 12:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
To: Frank.Li@oss.nxp.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2026 15:17, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>   static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	int ret;
>   
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>   		struct camss_async_subdev *csd;
>   
>   		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>   
>   		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>   	}
>   
>   	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>   }
>   
>   /*
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
