Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3842C51C
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080377; cv=none; b=A2nVcDGNdhgBm+BULJV/9Lt39Mt16QM8LZjwWWEaL2apS0+vNy3mlo8J8DKH++UzzNAqIN8Qhbs4gj4cVnHQui4Uq/UrcyZAcaJwQRzrxzXi/IieKgZ5t3GdJx5/XHXoSDOyZAYDF6VV3pTwXzwfbjG/g0GS93ECXKyafCnigRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080377; c=relaxed/simple;
	bh=PNPMF5HaBye8yE0aDiamjT570/SAuJ9juWmwx+bL9Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFvAWky4vc857IKpX6HZJEq9LJllFFnaDZBqLQJbzMaEv/yj6K6aDdOLlL+k8Oog6w06ecB2UJarSgVxrW2YLbTw2LER8PnX0G6OcSHsrh/49ZgH4s5psJS/qBEZhrv1dAdZpytiHtwrgkAnI3sGmMG5NSPstmoZu1+r68M6LdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTduBuC8; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTduBuC8"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a05d236f53so2231821137.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080367; x=1790685167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEcTTkslC2Kv8w+0UHkjnSap9hMo5JHz0Hbe2wfuDcA=;
        b=LTduBuC8BgcKe1M5AlpUxNDKvPgnQS+LC/Y8yCsapX/pYxa9U7ZxNUDpbgmkPcYLw9
         1tAOy9uCrNmlwD6S1mJAg2bVkpsKnyk356p7zmmQRzTZ/Xl/ZmdkOaDDTJFSyJALbcr3
         yBGw3vg65Rr1fYhMUzSyE1DQ83+5ZTQty6g/R1jjvYu0w8lTNDTr3OGNYn2FUsf7tJAB
         rQW1ayAClHEt0z2Ry7+lbK2w+vhnqS/RzfL/Etrj0brVRqqztikK6cWiusTpn0o7d/yK
         SkTdINjMKFregAa2nIq+QNSazLWzSIpKm6C0C2RBcAXFM6PiW/8i2DOrmO7vioaJU7EI
         MNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080367; x=1790685167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEcTTkslC2Kv8w+0UHkjnSap9hMo5JHz0Hbe2wfuDcA=;
        b=LGz7b5tFl/OjevxCbjIDq6b6ugEE7XSuBAd33Ubheb3IWZU840XbMEGNNRFwZ2zRnP
         +RJ1wxNgrWINxgOkDP1YqFx4fJbL7AxxewyklSkEkQMXiUfdb+Ae53BnrU9r2WLncGhQ
         xX1WDv6+cY/Bln6oLXG8KECRGGDlvT17HPFggj4EylZYk6tOuCUiBgN36CUoDayn2oN6
         1lzNiLN6cPa9QPvC7hnhHFk/0zruBeNgl9SpJs/D8u16XPvqO4jWmR82pwy6HjCLu5JV
         yblbH38J8GOQ6wsJHhl8sn98ql4BpLUBUC4Sq6Uo5cZ5XpM/EtWYcjzNdx5aTKZFC09D
         4F3Q==
X-Forwarded-Encrypted: i=1; AKwUvBws6gpnJ1oayjPXqglJ1zXg+N9+1rTGOuWCoeZxIs4dsagE/s2gha+km/s8A1Mpq12A/1yyVQw3AhXYTg==@vger.kernel.org
X-Gm-Message-State: AFuF++n53LqACxx9V+bsWdaS8SraH47x/twabZ6wOgtPdc25xn84UFZ1
	Nocz0YUvvoitekizer5+c5bpVLkXo8W+O+/6/C5w4vTN2RTvoc0UIoF1
X-Gm-Gg: AYBFou0temwGE0/bZxRlZdMFGzkndM9BYUmvh+KurBy96pTOViFwF796AgZQemopB+6
	oItrz8zUd+vmpiUz6dzWxiXTlWUNsYaQQgr4J/6WmHTm3VEGa3rk1iDH8bOvl7/kNRJEOAskBQD
	Bdt21zdrtx7GD+HRDBcWYlcf/0artPaCbVUlLd5Cj48sOvcE7Fl92RnzktbiRewR1UIvOyPlkqM
	xvV4g6mJF1sOkBeQiadi6twmAcv3+hl9oWYibYmDj4z55SfktCOCCPS0+9PWZqFGYzhZBJjFIMf
	HmfQCcppvBvEgNOe6f5y+bAGhpC1ZSuujCa0TD0Ihtnp9e4Uj7Kduh00BT7G6QrYaoDj7lt/qc0
	6vnexFhXBWKs+9ftSZ/DDcoloOw5j7/eKrEdZNVQK9LeHTX5/7RI2xOOqVHqw152ZziDwvkqZ3V
	fTC6uQnWlWcZ2Cc+aW2taW7YfL6GUZRCZmhiE5ZcnZQmmvQ+Q4EVziXl71SQNYiJFek0sffSSHF
	KjM
X-Received: by 2002:a05:6102:e08:b0:7a7:19aa:8a82 with SMTP id ada2fe7eead31-7a719aa90d7mr5707248137.29.1790080367089;
        Tue, 22 Sep 2026 05:32:47 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab18848f54sm1541461137.12.2026.09.22.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:32:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:32:41 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Frank Li <Frank.li@oss.nxp.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <hufoatx76dnto4w3f33lx3gr7efwgcmkj3x7nzofofpzm5f3hn@pvuswzm5ielf>
References: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
 <arGNRTpmYwB2_gLk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arGNRTpmYwB2_gLk@kekkonen.localdomain>

Hi Sakari,

On Mon, Sep 21, 2026 at 11:02:13PM +0300, Sakari Ailus wrote:
> Hi Leonardo,
> 
> On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> > Hi all,
> > 
> > Some time ago, we had sent a patch that implemented the .get_mbus_config
> > function for the OV5640 camera. This change was necessary for the camera to
> > work with the i.MX6 after the v5.18 release.
> > 
> >     https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u
> > 
> > The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
> > implemented on drivers that don't have dynamic lane configuration. There were
> > proposals of implementing it in other points of the camera pipeline, but no
> > conclusion was reached.
> > 
> > We are planning to send the overlays for this camera for the Apalis iMX6, but
> > we verified that this patch is still needed for the camera to work on the
> > current mainline. Below are the commands to configure the pipeline, which
> > explicitly require a .get_mbus_config from the camera driver.
> > 
> >     root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> >     [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
> >     root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     Unable to setup formats: Inappropriate ioctl for device (25)
> >     [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> >     [   62.616204] ipu1_csi1: failed to get upstream media bus configuration
> > 
> > I am not very familiar with this subsystem, and it's been years since this
> > discussion took place, so I wanted to know what are your thoughts about this
> > patch and what the correct approach would be here. Was there any change that
> > would make this patch ok to be applied today? Do you think this still should
> > be included somewhere else on the pipeline?
> 
> My objection to the approach was about adding code that does very little or
> nothing to potentially a rather large number of drivers.
> 
> Since that we've gotten v4l2_get_active_data_lanes() that however seems to
> be used by the imx-mipi-csis driver only. Could using that solve the
> problem you have?

Hmm, looking at the implementation of v4l2_get_active_data_lanes it
seems to actually still use .get_mbus_config, and falls back to a
maximum value passed as an argument.

Furthermore, the error comes from imx-media-csi.c, and it doesn't seem
to be reading the number of lanes in the config, but rather the type of
the mbus (all the uses of the gotten mbus_cfg boil down to checking the
value of mbus_cfg.type). The receiver (imx6-mipi-csi2.c) actually seems
to get the number of lanes statically, and handle well the case where the
camera doesn't implement .get_mbus_config.

To test this, I hard-coded mbus_cfg->type = V4L2_MBUS_CSI2_DPHY inside
csi_get_upstream_mbus_config(), and the test above worked with that. So
as far as I understand it, imx-media-csi.c really only needs to know
what the type of the bus is.

The csi_get_upstream_mbus_config function already identifies whether
it's connected directly to the receiver or the mux, see the switch
statement below. If I understand correctly, in the case where it's
connected to the receiver directly, this is already known to be CSI-2,
so (I think) we can set the type value directly in this case.

For the mux I am not entirely sure. From the "Figure 19-1. CSI2IPU
gasket connectivity" figure in the IMX6DQRM TRM [1] (the same one Jacopo
referenced on the other thread), the mux's possible inputs seem to be
well defined to be either the receiver itself or the parallel interface.
Given this, maybe we could similarly infer the bus type from the
sd->grp_id gotten from the mux.

static int csi_get_upstream_mbus_config(struct csi_priv *priv,
					struct v4l2_mbus_config *mbus_cfg)
{
    ...
	switch (sd->grp_id) {
	case IMX_MEDIA_GRP_ID_CSI_MUX: // <------ Mux
		sd = imx_media_pipeline_subdev(&sd->entity,
					       IMX_MEDIA_GRP_ID_CSI2,
					       true);
        ...
		break;
	case IMX_MEDIA_GRP_ID_CSI2: // <------- Receiver
		break;
	default:
		...
		break;
	}
...
}

[1] https://www.nxp.com/webapp/Download?colCode=IMX6DQRM

What are your thoughts on this?

Kind regards,
Leonardo
