Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2A53E0B
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208195; cv=none; b=mobDwH25neN42fJM5s5F44cDelc10vKorbB4VGZdfpUIJcqmmPMkekFbzDCeAswktU4nfnl83RKQFtH7tmTy1MmSpVYOjqT0cpuf62lqNUY9Yt06XjQieUN5VPdrcDQJxGVbyevFhp9Y5Qtb+QdlkAgpqxSAQ1YU4Ctc0D2Ct00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208195; c=relaxed/simple;
	bh=oXV5U2weJ7HdA8YWcjefznLiGyuO0HmbnZ1rGXpm2SQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AX7Hz19EN1DJ/hbVITPTKUtg0UHHZkXBZWWsP/benLSy88le1pF9UtPaA4JOVpYf/MLD+vMIiiHIdVLQintMv+wn1+AXlx0vxrbj5gflBoHPaRRlcORT6NkEsFoQZHi+hXDFk80YhUtCBEYCFEE0msCmhlsD6J1AW1n3fyfu968=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jg8m1k+U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jg8m1k+U"
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:aa9e:184f:96b2:e40a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 249D02D7;
	Tue, 23 Jun 2026 11:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782208146;
	bh=oXV5U2weJ7HdA8YWcjefznLiGyuO0HmbnZ1rGXpm2SQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Jg8m1k+U5Er6Ds31mv9TteH6npwzTuCMjf5K6Z+hTU3jfzrDTV8lIvE+5PAmcet5X
	 M+HEKCY4BdQMILzx11t44JMGlpB3wxdqz7DBnA9LBWLKdLgKhmhrU2H7Slb8SLIqZR
	 pu0nIsZ7r9YvcuS2JXj7DSMiOZPA+UZtVV3Wy9bQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260501190339.3449193-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260501190339.3449193-1-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] media: uapi: rkisp: Correct name version enum
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dafna Hirschfeld <dafna@fastmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 23 Jun 2026 18:49:38 +0900
Message-ID: <178220817887.292172.8295943288467268239@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Niklas S=C3=B6derlund (2026-05-02 04:03:39)
> The name of the enum to hold the mapping of parameter buffer versions
> have a typo in the name, correct it. While this is a uAPI header the
> impact should be minimal as the enum is only used as a collection for
> the one version number supported.
>=20
> Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params f=
ormat")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  include/uapi/linux/rkisp1-config.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkis=
p1-config.h
> index b2d2a71f7baf..7638b2220600 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1535,11 +1535,11 @@ struct rkisp1_ext_params_wdr_config {
>         sizeof(struct rkisp1_ext_params_wdr_config))
> =20
>  /**
> - * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters v=
ersion
> + * enum rkisp1_ext_param_buffer_version - RkISP1 extensible parameters v=
ersion
>   *
>   * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible param=
eters
>   */
> -enum rksip1_ext_param_buffer_version {
> +enum rkisp1_ext_param_buffer_version {
>         RKISP1_EXT_PARAM_BUFFER_V1 =3D V4L2_ISP_PARAMS_VERSION_V1,
>  };
> =20
> @@ -1601,7 +1601,7 @@ enum rksip1_ext_param_buffer_version {
>   *     +----------------------------------------------------------------=
-----+
>   *
>   * @version: The RkISP1 extensible parameters buffer version, see
> - *          :c:type:`rksip1_ext_param_buffer_version`
> + *          :c:type:`rkisp1_ext_param_buffer_version`
>   * @data_size: The RkISP1 configuration data effective size, excluding t=
his
>   *            header
>   * @data: The RkISP1 extensible configuration data blocks
> --=20
> 2.54.0
>
