Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC634A8FCB
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 19:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376326; cv=none; b=Sh2VwAJ9wLXtHtQuNz2w4anrsRE8LbtvOGnc8njDMDu6VIPc2wHSALlzTpgaSlWgDFwgP/z/brXck/4aQ4oYCYqbIyAVVJyx+1ucwZh0wtdm2EfAzhjqDmm3W+pMnvTiC5/wnMiM5JRDpeQtTqpBgrvbEW7t1aVfVwWOYMQrrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376326; c=relaxed/simple;
	bh=tvYhMltgExTAkepAw+P8pER/L0LD52lDloroQDU4srg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coGbaSy9jaTHMsYBl2cD+VaDg6CC7JYNNURskpqALPzaauU/gQqn6Z082o/CIrokhTOYQqhedNt7jH/IhYpE/20kaj6WnhqXmZNdgICfYB5Cbm+jtEDj38sT71h1mF7LGwB4bbu0thh9ySEWSLJoygBrgcUorn7XNxlvNIw+8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6YkX2EK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6YkX2EK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso9936465e9.2
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 12:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788376323; x=1788981123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIh1Z1os9OR9FRWnj1L4UP3L2G03FKH10NfmqQiyFa8=;
        b=a6YkX2EKOKfR6N6WkyqxJQUg2HkRU1vvYwgzEeN0WnPXJpExfoF7UNfR5cmZKerPYO
         nKY+QdaswwSkzpDOk09IfTHb5BlzIopzomerpAiSWwo7iUmqS4NLVJBCWjJKxl7PgtR8
         mk4mWn75fz+pwkEr6n4nq3eP+nDjNfUgUes8hqRGHrbWZcIlR9Em1gnNl1767WoqLYqH
         n+VV2M94v3O3xsL8LHRlfHC+MQtRRIx4EWMBykLj5S7m1U/9s7nU9HVpYkHcLF1tuVbQ
         1+DCAD83xo2zXPLYXlfm1RH7Qg+E9cS4BJZECShsoFVp8C8lI7GrbrJA4eMuOA0gCYM6
         ULNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376323; x=1788981123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIh1Z1os9OR9FRWnj1L4UP3L2G03FKH10NfmqQiyFa8=;
        b=AWcDwBanKO4AVesy4TsukT4woroyRIlQX41H7V9TLrdupnbGiB6Vbo5nDh1yhIsssN
         mceG3OdVq4tRAvRdxGoFY8olyKzdXrwJzVSgG3SHdzPHg8846ioOk+zk3PEgdVF7sTsH
         3idHhte2wD641qCyXsgej6JKQUi+CmT5SVZz7s9YfqiYCqetNCqvOMUEx98yVGZs0TYN
         wS5yDZKm08tLG4bYSeq4H5NjdWIVcjAQl6VpQroLvi2WYeCefQqHUJsNibfS3hezzHSf
         lRFZKB/OIGnyjOLxfoRem3lIxQSWpQgSIlFfm87BcNyqPfkHgH32IKeqw3xIug5VUzTf
         btLg==
X-Forwarded-Encrypted: i=1; AKwUvBw5jxV4U9LZYjDL1cRGmKiuBQyQ3KEjIM3Rk6OY21EblpFAVBhMDSqasHCDi6ldx5uOGZQg9cvs6hp1nw==@vger.kernel.org
X-Gm-Message-State: AFuF++kiQ4mKQJIvAatsPujVye1VP7TazxtYe5Ows6uH5jDPESgnRf0w
	aJABGaeSsJLLBIGUSWB7u7CyQMLs0jm/15YmiBE5ZVe0wy13ybFxlLqjOIUb1EPWI0ZIoA==
X-Gm-Gg: AYBFou2bt8LPacMAuzQOUJ3PCPVzzcd+Kki3eYglBZnMVgEVa064CzaxqBcxu/2lrdD
	z5mK/xhMPs1/B1+mxB2xa+O92urVoAdMend1DII9R0jj/O1dcBlhhYgJLcD3kuR4o1x54rF2Pyv
	S6fzya9IPPeNdPOTUtvPz/96gYdFYwB29XanybgFpR3Wum350EppECyQYG5TjAIC1jm+bNIqt1K
	ktozl60PDNEt1lEirNwJNXvYB1TDBqXYDz6hZDcHGNoLV2WbnSzDY7V32msmopJRbB4M3msAIuA
	pvXM4G+EGcBMBeK45ZoXJ6G0ORtFe6Xy2hBchkYIuiStcavFIqZmvxSnQT+Pu09up86uzc4gGZ7
	DCkdmFIzB02bve60DkLuTpHKpVe0rY9FjvIXBQrWYa4UwYw+CQ6HC0I2uLy0nR9kukKgqr6Icvk
	saiEqTIDA7BjPUfOJVo6+L0JJoT8ITgfIcHGCnHjxC3jPJJ/+1IQm5g04ihV0SRULefEjqJWcxG
	W+usyXqFKJp/J6f50mZyvVA6mGy
X-Received: by 2002:a05:600c:1913:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49ce583d6ecmr99871595e9.9.1788376322367;
        Wed, 02 Sep 2026 12:12:02 -0700 (PDT)
Received: from [192.168.8.169] ([92.241.26.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e736a6sm7914544f8f.5.2026.09.02.12.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 12:12:01 -0700 (PDT)
Message-ID: <fc0ae382-7a55-4b7b-af1b-e5ceb9309aff@gmail.com>
Date: Wed, 2 Sep 2026 22:11:59 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 4/7] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
To: Fernando Rimoli <fernandorimoli11@gmail.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com,
 linux-kernel@vger.kernel.org, Arsalan Naeem <naeemarsalan@gmail.com>,
 Jakob Berg Jespersen <dev@berg.pm>, Lucas Lis <lucaseze.lis@gmail.com>,
 Kengo Oki <dev.kengo.fugu0141@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-5-fernandorimoli11@gmail.com>
Content-Language: en-US
From: Fil Dunsky <filipp.dunsky@gmail.com>
In-Reply-To: <20260902142322.73523-5-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 
Tiger Lake (8086:9a19)

Scope: patches 4-7, as in v4. Patches 1 and 2 are already in my tree and
this machine enumerates INT33BE, so neither is exercised here; patch 3 is
not either, there is no DT on this platform.

Retested rather than carried over, because patches 5 and 6 are not the
code I tagged in v4. Same machine and kernel as before: 7.2.2 plus the
linux-surface patch set. Patches 3 to 6 applied to it unchanged; patch 7
needed two hunks by hand, both because that tree's sensor table differs
from yours — it has no HIMX1092 entry, which the first hunk uses as
context, and it carries its own out-of-order OVTI5693 entry. I put the
flagged entry immediately before the generic one, as the new adjacency
rule requires.

Capture from the ISYS node, three times in a row with the sensor
runtime-suspending in between:

   60 frames, SBGGR10 2592x1944, 604661760 bytes, 28.63-28.65 fps  (x3)

   MIPI_CTRL00 (0x4800) read over i2c while streaming: 0x20
   MIPI_CTRL00 with no stream: i2c times out, the sensor is powered off

0x20 is bit 5 alone, so the property still reaches the sensor driver
through the reworked per-IPU match, and the whole path is exercised
rather than "the camera works". Three captures because of the warning in
your cover letter: on this machine the first one after a cold boot
succeeds even without the entry.

Patch 6's adjacency rule behaves as described. INT33BE appears twice in
this tree, the Tiger Lake entry and the generic one, and the sensor is
connected once: "Connected 3 cameras" and exactly one ov5693 subdev in
the media graph. I also ran it with the pristine upstream table, where
this machine has no third sensor: "Connected 2 cameras", one ov5693, and
the same three captures.

Patch 5 is exercised by the sensor probing at all. ov5693 refuses an
endpoint with no link frequencies, and then refuses one that does not
offer 419.2 MHz, so a probe that succeeds means the running index put
link-frequencies and clock-noncontinuous in the right slots and did not
displace anything. The other case, where nr_link_freqs is 0 and
clock-noncontinuous packs down into the freed slot, is not exercised
here: both flagged entries carry one frequency.

The other two sensors on this machine are unaffected: OV13858 rear
captures normally, and the VD55G0 IR camera still does face
authentication.

The "stream stop time out" and "stream close time out" at teardown appear
with and without the series, as you say.

Built clean, no new warnings.

One practical note for anyone testing this by swapping modules rather
than booting a whole kernel. With CONFIG_MODVERSIONS the series moves
symbol CRCs, because struct ipu_sensor changes size:

   ipu_bridge_parse_ssdb  0x8730390b -> 0x222edd7f
   ipu_bridge_init        0xbb0996a9 -> 0x573da924

So intel-ipu6 and intel-ipu6-isys have to come from the same build as
ipu-bridge. I compared Module.symvers before swapping and rebuilt all
three together, so I did not hit it, but installing ipu-bridge alone
would have left the other two refusing to load.

On 9/2/26 17:23, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default, which lets the MIPI clock run freely. The IPU3 CSI-2
> receiver tolerates this, but the IPU6 receiver (e.g. on Microsoft
> Surface Pro 7+, Pro 8, Pro 9 and Surface Go 4) fails to lock onto the
> link, so the sensor streams but capture times out with "stream stop
> time out". On most affected machines no frames arrive at all; on some
> the failure is intermittent.
> 
> Gate the clock lane while idle at stream on when the endpoint requests a
> non-continuous clock.
> 
> Only the gate bit is touched, so platforms that do not request it are
> unaffected. No counterpart is needed at stream off, as the link is down
> by then and the register returns to its default when the sensor is
> powered off.
> 
> The property is supplied by the ipu-bridge in a subsequent patch.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
> Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
> Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
> Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
> ---
>   drivers/media/i2c/ov5693.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 02236f3db..cedc6ea03 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -35,6 +35,11 @@
>   #define OV5693_STOP_STREAMING			0x00
>   #define OV5693_SW_RESET				0x01
>   
> +/* MIPI transmitter control */
> +#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
> +/* Gate the clock lane when there is no packet to transmit */
> +#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
> +
>   #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
>   /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>   #define OV5693_CHIP_ID				0x5690
> @@ -144,6 +149,9 @@ struct ov5693_device {
>   	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
>   	struct clk *xvclk;
>   
> +	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
> +	bool clock_ncont;
> +
>   	struct ov5693_mode {
>   		struct v4l2_rect crop;
>   		struct v4l2_mbus_framefmt format;
> @@ -611,6 +619,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>   {
>   	int ret = 0;
>   
> +	/*
> +	 * Gate the MIPI clock lane while idle if the CSI-2 link is configured
> +	 * for a non-continuous clock. Only that bit is touched, and only in
> +	 * that case, so the register keeps whatever the platform left in it
> +	 * and the clock stays free-running as before everywhere else. It
> +	 * needs no counterpart at stream off: the link is down by then, and
> +	 * the register returns to its default when the sensor is powered off.
> +	 */
> +	if (enable && ov5693->clock_ncont)
> +		cci_update_bits(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
> +				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE,
> +				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE, &ret);
> +
>   	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
>   		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
>   		  &ret);
> @@ -1259,6 +1280,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
>   		goto out_free_bus_cfg;
>   	}
>   
> +	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
> +			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +
>   out_free_bus_cfg:
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
>   

