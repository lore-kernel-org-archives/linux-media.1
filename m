Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612645;
	b=s/8JwsR3oGVy8SHJof6bNRzF+ryO8PUqa1WtrZnPjYWyuhYJNr7END4wlzVBfah96YME
	 1lwoWCNcZz9ggAEFWTN9paNTe3Eq1azwupMIIfSk+3kDomYUJjhNc734f8CtQeCCofTq5
	 27ocLzcL4HihXFtMJt8tg3QJA4l24I8do7xwHx46afxfYNvQuavMo3R2OfQBDASgKf7Mb
	 kwPMfpArsz4cOzewRxjw/xH5EGOlRtP5aMpB69dpKeCgpakZ+bnnP8WPjVKeULcdVpZcB
	 ziAIQdTJwA019IV871gBTts4xjinAapUGsWpj5vBgGfkZaUoLmCEhegtuWMxPsiVWHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612645;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=em3q3rTGEe34qKn5SYeVblIfDklxEhM2gcMaXJaWb5Q=;
	b=uy4N51ZseVjrTIpjJkh0ng9nqLIbQfuIO53P3nsIQyrFo0EIoOJ52QX75PWWNJmnRJFJ
	 uXS7YNSqjNlyb3ByFzsm6+tlHW35knmCsuVGh5D4/kdBMDmU2y86c5NhMiSMTDEYnInXk
	 Owg+3SbY1fC9vaw5vxJSsxOJDj3KcEwF7Vj0tsfdGs9unaRMBGz3DuCMFUMWTqyCC3Vao
	 57MvvdL7VrTM77ZzGIUNOOIrNCazTghOSi8CyVcGFdZxjJvhCrH+NYYz8lLqRWO2E6bz2
	 ZuyqZvIXDgEk7TcYBX/3bRR1rEkrRaCvaQJUwep1tjfSU/o0IuJ3qB7IjgspDBt/FFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JfB/7iJq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67569606A321;
	Wed, 25 Nov 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfB/7iJq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2434A1F000C0;
	Wed, 25 Nov 2026 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612644;
	bh=em3q3rTGEe34qKn5SYeVblIfDklxEhM2gcMaXJaWb5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JfB/7iJqiGK1cJ5Xrbp4c2onx4EmaVsrqgDgy1QFay15k6UtKHpkMOP6icxCmzUA7
	 bzwAarvsaa/KuAdIV3XbutWuUv9ZASPEnyMI0XpmK1ZHvonPMa1xEiBb2T6MzsS7vw
	 6OBfAiGQEFbe/nc/Ng2DkwEkO+ab2OXhkDPgcQyQONF+C/0QjCidDKXtmS3Eufxjev
	 YiBmLu094VgYylU6pFuoUzy0K6BGS57cHIIsj7Q41J1NoFflgPkTd3kKUmS3iPWTRq
	 pFcppMSPbTQLzFBHLsRuUaVLZkJRBvKii8JFOg7aLZhhas49+cnfWoH8e72bcfY43t
	 +kzHyb8U+IgvA==
Message-ID: <7969efe4-40e0-4c1e-b36d-dbb939bb4c64@kernel.org>
Date: Wed, 25 Nov 2026 14:17:21 +0100
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
Subject: Re: [PATCH v7 11/12] media: Add subdevice driver for the Mstar
 MST3367 HDMI receiver
To: Matthew Laux <matthew.laux@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20261121035523.26764-1-matthew.laux@gmail.com>
 <20261121035523.26764-12-matthew.laux@gmail.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261121035523.26764-12-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Matthew,

On 21/11/2026 04:55, Matthew Laux wrote:
> Implement a V4L2 subdevice driver for the MST3367. This was developed
> through reverse engineering the Windows driver, and capturing USB packets.
> The driver supports both HDMI and analog component inputs. YPbPr and RGB
> HDMI sources have been tested. I also added a couple custom DV timings
> for non-interlaced 240p and 288p over component, which are also tested and
> working with this chip.
> 
> I tested this with a ThinkPad's video output, MacBook (10-bit deep color),
> Nintendo Switch (both full and limited range) and PS4 720p/1080i/1080p.

Nice work!

There is just one issue with InfoFrames:

> 
> Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
> ---
>  MAINTAINERS                 |    7 +
>  drivers/media/i2c/Kconfig   |   11 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/mst3367.c | 1134 +++++++++++++++++++++++++++++++++++
>  include/media/i2c/mst3367.h |   27 +
>  5 files changed, 1180 insertions(+)
>  create mode 100644 drivers/media/i2c/mst3367.c
>  create mode 100644 include/media/i2c/mst3367.h
> 

<snip>

> diff --git a/drivers/media/i2c/mst3367.c b/drivers/media/i2c/mst3367.c
> new file mode 100644
> index 000000000000..0d71807a2a5d
> --- /dev/null
> +++ b/drivers/media/i2c/mst3367.c

<snip>

> +/*
> + * Fill @avi from the AVI InfoFrame registers. Returns -ENODATA if no
> + * InfoFrame has been received, e.g. from a DVI source.
> + */
> +static int mst3367_read_avi(struct mst3367 *mst,
> +			    struct hdmi_avi_infoframe *avi)
> +{
> +	u8 pb[5];
> +	int k, ret;
> +
> +	ret = mst_bank(mst, 0x02);
> +	if (ret)
> +		return ret;
> +
> +	ret = mst3367_read(mst, MST3367_PKT_STATUS);
> +	if (ret < 0)
> +		return ret;
> +	if (!(ret & MST3367_PKT_STATUS_AVI))
> +		return -ENODATA;
> +
> +	for (k = 0; k < ARRAY_SIZE(pb); k++) {
> +		ret = mst3367_read(mst, MST3367_AVI_PB1 + k);
> +		if (ret < 0)
> +			return ret;
> +		pb[k] = ret;
> +	}
> +
> +	avi->colorspace = (pb[0] >> 5) & 0x3;
> +	avi->colorimetry = (pb[1] >> 6) & 0x3;
> +	avi->itc = !!(pb[2] & BIT(7));
> +	avi->extended_colorimetry = (pb[2] >> 4) & 0x7;
> +	avi->quantization_range = (pb[2] >> 2) & 0x3;
> +	avi->video_code = pb[3];
> +	avi->ycc_quantization_range = (pb[4] >> 6) & 0x3;
> +	avi->content_type = (pb[4] >> 4) & 0x3;
> +	avi->pixel_repeat = pb[4] & 0xf;

InfoFrame data must also be exported to debugfs. See v4l2_debugfs_if_alloc etc.
in v4l2-dv-timings.h.

It's implemented in most/all HDMI receivers, so you can take a look at how it is
done.

The exported InfoFrame data can be parsed by edid-decode.

> +
> +	return 0;
> +}
> +
Regards,

	Hans
