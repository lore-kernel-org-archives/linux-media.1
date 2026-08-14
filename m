Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E777542BC23;
	Fri, 14 Aug 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727383; cv=none; b=uWzwmcqrZ3rwq9zWOWBnE/ZRDyc+kRfukQRIknxy4rtCKUV1Sk9ktWD8j1aFvpptmUG+LtsFZ7JSuqpPbVggg4w5pMMoVgsduodXSzg3U8S477cCtvktlKD5iYQSoqV2FbmDpaI8mF94zy5JP8pKHHqUsGpczASqKWTLx5ZKu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727383; c=relaxed/simple;
	bh=oDdZWPi++wtm+NYkYV5i4/8V2mWrRKHMa7txx9RucIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDtfk+pNX/rsSwxaF/SNsi+NnzkJNuL16jhtwQAE8fww4bMELqQIEteKS2N1MV14O30BZQ1Qh/+IMzzeIkH5kyyjttq8U7LNn6anC5aEobeT9kHjkNYyFLs3Iv//8ZQTGBj+jsUAxMGfrq3xkHCTsggI71QiD+3SPlwkw9KcAgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from pirotess (unknown [79.117.174.78])
	by iodev.co.uk (Postfix) with ESMTPSA id 49B9D5853D8;
	Fri, 14 Aug 2026 19:09:38 +0200 (CEST)
Date: Fri, 14 Aug 2026 19:09:36 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ben Collins <bcollins@bluecherry.net>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: solo6x10: Propagate I2C read errors
Message-ID: <an9L0P0j3ULzKjqp@pirotess>
References: <20260814134150.1388305-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814134150.1388305-1-ruoyuw560@gmail.com>

On 14/Aug/2026 21:41, Ruoyu Wang wrote:
> solo_i2c_readbyte() ignores the number of messages completed by
> i2c_transfer() and returns the read byte even when the transfer did not
> complete. A short transfer can therefore expose an uninitialized stack
> byte to chip detection, input-status queries, and ALSA gain controls.
> 
> Return status separately from the output byte and map short transfers to
> -EIO. Propagate failures where callers provide an error channel. At
> input-status and write-and-verify sites, avoid consuming the output after
> a failed read while retaining the existing ioctl and best-effort retry
> behavior.
> 
> This issue was found by a static analysis checker and confirmed by manual
> source review.
> 
> Fixes: faa4fd2a0951 ("Staging: solo6x10: New driver (staging) for Softlogic 6x10")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Changes in v2:
> - replace the zero-initialization fallback with an explicit error channel;
> - update every active caller without making ENUMINPUT fail on status-read
>   errors;
> - preserve the existing best-effort write-and-verify policy and leave disabled
>   code untouched;
> - rebase onto media-committers next at 4900cad020c0.
> 
> v1: https://lore.kernel.org/r/20260813153120.3952770-1-ruoyuw560@gmail.com/
> 
>  drivers/media/pci/solo6x10/solo6x10-g723.c    |  17 ++-
>  drivers/media/pci/solo6x10/solo6x10-i2c.c     |  15 ++-
>  drivers/media/pci/solo6x10/solo6x10-tw28.c    | 114 ++++++++++++------
>  drivers/media/pci/solo6x10/solo6x10-tw28.h    |   4 +-
>  .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |   4 +-
>  drivers/media/pci/solo6x10/solo6x10-v4l2.c    |   5 +-
>  drivers/media/pci/solo6x10/solo6x10.h         |   3 +-
>  7 files changed, 108 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
> index e41b8d90a30ecc..5138a6ec55df61 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-g723.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
> @@ -257,8 +257,13 @@ static int snd_solo_capture_volume_get(struct snd_kcontrol *kcontrol,
>  {
>  	struct solo_dev *solo_dev = snd_kcontrol_chip(kcontrol);
>  	u8 ch = value->id.numid - 1;
> +	u8 gain;
> +	int ret;
>  
> -	value->value.integer.value[0] = tw28_get_audio_gain(solo_dev, ch);
> +	ret = tw28_get_audio_gain(solo_dev, ch, &gain);
> +	if (ret)
> +		return ret;
> +	value->value.integer.value[0] = gain;
>  
>  	return 0;
>  }
> @@ -269,14 +274,16 @@ static int snd_solo_capture_volume_put(struct snd_kcontrol *kcontrol,
>  	struct solo_dev *solo_dev = snd_kcontrol_chip(kcontrol);
>  	u8 ch = value->id.numid - 1;
>  	u8 old_val;
> +	int ret;
>  
> -	old_val = tw28_get_audio_gain(solo_dev, ch);
> +	ret = tw28_get_audio_gain(solo_dev, ch, &old_val);
> +	if (ret)
> +		return ret;
>  	if (old_val == value->value.integer.value[0])
>  		return 0;
>  
> -	tw28_set_audio_gain(solo_dev, ch, value->value.integer.value[0]);
> -
> -	return 1;
> +	ret = tw28_set_audio_gain(solo_dev, ch, value->value.integer.value[0]);
> +	return ret ? ret : 1;
>  }
>  
>  static const struct snd_kcontrol_new snd_solo_capture_volume = {
> diff --git a/drivers/media/pci/solo6x10/solo6x10-i2c.c b/drivers/media/pci/solo6x10/solo6x10-i2c.c
> index 7db785e9c99791..52f8a95c370d72 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-i2c.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-i2c.c
> @@ -22,10 +22,11 @@
>  
>  #include "solo6x10.h"
>  
> -u8 solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off)
> +int solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off,
> +		      u8 *data)
>  {
>  	struct i2c_msg msgs[2];
> -	u8 data;
> +	int ret;
>  
>  	msgs[0].flags = 0;
>  	msgs[0].addr = addr;
> @@ -35,11 +36,15 @@ u8 solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off)
>  	msgs[1].flags = I2C_M_RD;
>  	msgs[1].addr = addr;
>  	msgs[1].len = 1;
> -	msgs[1].buf = &data;
> +	msgs[1].buf = data;
>  
> -	i2c_transfer(&solo_dev->i2c_adap[id], msgs, 2);
> +	ret = i2c_transfer(&solo_dev->i2c_adap[id], msgs, ARRAY_SIZE(msgs));
> +	if (ret == ARRAY_SIZE(msgs))
> +		return 0;
> +	if (ret < 0)
> +		return ret;
>  
> -	return data;
> +	return -EIO;
>  }
>  
>  void solo_i2c_writebyte(struct solo_dev *solo_dev, int id, u8 addr,
> diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.c b/drivers/media/pci/solo6x10/solo6x10-tw28.c
> index 8f53946c67928f..66a9fd1e04ee63 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-tw28.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-tw28.c
> @@ -168,17 +168,17 @@ static const u8 tbl_tw2865_pal_template[] = {
>  
>  #define is_tw286x(__solo, __id) (!((__solo)->tw2815 & (1U << (__id))))
>  
> -static u8 tw_readbyte(struct solo_dev *solo_dev, int chip_id, u8 tw6x_off,
> -		      u8 tw_off)
> +static int tw_readbyte(struct solo_dev *solo_dev, int chip_id, u8 tw6x_off,
> +		       u8 tw_off, u8 *val)
>  {
>  	if (is_tw286x(solo_dev, chip_id))
>  		return solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
>  					 TW_CHIP_OFFSET_ADDR(chip_id),
> -					 tw6x_off);
> +					 tw6x_off, val);
>  	else
>  		return solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
>  					 TW_CHIP_OFFSET_ADDR(chip_id),
> -					 tw_off);
> +					 tw_off, val);
>  }
>  
>  static void tw_writebyte(struct solo_dev *solo_dev, int chip_id,
> @@ -200,9 +200,10 @@ static void tw_write_and_verify(struct solo_dev *solo_dev, u8 addr, u8 off,
>  	int i;
>  
>  	for (i = 0; i < 5; i++) {
> -		u8 rval = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW, addr, off);
> +		u8 rval;
>  
> -		if (rval == val)
> +		if (!solo_i2c_readbyte(solo_dev, SOLO_I2C_TW, addr, off,
> +				       &rval) && rval == val)
>  			return;
>  
>  		solo_i2c_writebyte(solo_dev, SOLO_I2C_TW, addr, off, val);
> @@ -582,14 +583,17 @@ static void saa712x_setup(struct solo_dev *dev)
>  int solo_tw28_init(struct solo_dev *solo_dev)
>  {
>  	int i;
> +	int ret;
>  	u8 value;
>  
>  	solo_dev->tw28_cnt = 0;
>  
>  	/* Detect techwell chip type(s) */
>  	for (i = 0; i < solo_dev->nr_chans / 4; i++) {
> -		value = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> -					  TW_CHIP_OFFSET_ADDR(i), 0xFF);
> +		ret = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> +					TW_CHIP_OFFSET_ADDR(i), 0xFF, &value);
> +		if (ret)
> +			return ret;
>  
>  		switch (value >> 3) {
>  		case 0x18:
> @@ -602,9 +606,11 @@ int solo_tw28_init(struct solo_dev *solo_dev)
>  			solo_dev->tw28_cnt++;
>  			break;
>  		default:
> -			value = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> -						  TW_CHIP_OFFSET_ADDR(i),
> -						  0x59);
> +			ret = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> +						TW_CHIP_OFFSET_ADDR(i), 0x59,
> +						&value);
> +			if (ret)
> +				return ret;
>  			if ((value >> 3) == 0x04) {
>  				solo_dev->tw2815 |= 1 << i;
>  				solo_dev->tw28_cnt++;
> @@ -641,13 +647,17 @@ int solo_tw28_init(struct solo_dev *solo_dev)
>  int tw28_get_video_status(struct solo_dev *solo_dev, u8 ch)
>  {
>  	u8 val, chip_num;
> +	int ret;
>  
>  	/* Get the right chip and on-chip channel */
>  	chip_num = ch / 4;
>  	ch %= 4;
>  
> -	val = tw_readbyte(solo_dev, chip_num, TW286x_AV_STAT_ADDR,
> -			  TW_AV_STAT_ADDR) & 0x0f;
> +	ret = tw_readbyte(solo_dev, chip_num, TW286x_AV_STAT_ADDR,
> +			  TW_AV_STAT_ADDR, &val);
> +	if (ret)
> +		return ret;
> +	val &= 0x0f;
>  
>  	return val & (1 << ch) ? 1 : 0;
>  }
> @@ -681,6 +691,7 @@ int tw28_set_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
>  {
>  	char sval;
>  	u8 chip_num;
> +	int ret;
>  
>  	/* Get the right chip and on-chip channel */
>  	chip_num = ch / 4;
> @@ -696,9 +707,13 @@ int tw28_set_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
>  	case V4L2_CID_SHARPNESS:
>  		/* Only 286x has sharpness */
>  		if (is_tw286x(solo_dev, chip_num)) {
> -			u8 v = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> -						 TW_CHIP_OFFSET_ADDR(chip_num),
> -						 TW286x_SHARPNESS(chip_num));
> +			u8 v;
> +
> +			ret = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> +						TW_CHIP_OFFSET_ADDR(chip_num),
> +						TW286x_SHARPNESS(chip_num), &v);
> +			if (ret)
> +				return ret;
>  			v &= 0xf0;
>  			v |= val;
>  			solo_i2c_writebyte(solo_dev, SOLO_I2C_TW,
> @@ -756,6 +771,7 @@ int tw28_get_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
>  		      s32 *val)
>  {
>  	u8 rval, chip_num;
> +	int ret;
>  
>  	/* Get the right chip and on-chip channel */
>  	chip_num = ch / 4;
> @@ -768,35 +784,48 @@ int tw28_get_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
>  	case V4L2_CID_SHARPNESS:
>  		/* Only 286x has sharpness */
>  		if (is_tw286x(solo_dev, chip_num)) {
> -			rval = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> -						 TW_CHIP_OFFSET_ADDR(chip_num),
> -						 TW286x_SHARPNESS(chip_num));
> +			ret = solo_i2c_readbyte(solo_dev, SOLO_I2C_TW,
> +						TW_CHIP_OFFSET_ADDR(chip_num),
> +						TW286x_SHARPNESS(chip_num),
> +						&rval);
> +			if (ret)
> +				return ret;
>  			*val = rval & 0x0f;
>  		} else
>  			*val = 0;
>  		break;
>  	case V4L2_CID_HUE:
> -		rval = tw_readbyte(solo_dev, chip_num, TW286x_HUE_ADDR(ch),
> -				   TW_HUE_ADDR(ch));
> +		ret = tw_readbyte(solo_dev, chip_num, TW286x_HUE_ADDR(ch),
> +				  TW_HUE_ADDR(ch), &rval);
> +		if (ret)
> +			return ret;
>  		if (is_tw286x(solo_dev, chip_num))
>  			*val = (s32)((char)rval) + 128;
>  		else
>  			*val = rval;
>  		break;
>  	case V4L2_CID_SATURATION:
> -		*val = tw_readbyte(solo_dev, chip_num,
> -				   TW286x_SATURATIONU_ADDR(ch),
> -				   TW_SATURATION_ADDR(ch));
> +		ret = tw_readbyte(solo_dev, chip_num,
> +				  TW286x_SATURATIONU_ADDR(ch),
> +				  TW_SATURATION_ADDR(ch), &rval);
> +		if (ret)
> +			return ret;
> +		*val = rval;
>  		break;
>  	case V4L2_CID_CONTRAST:
> -		*val = tw_readbyte(solo_dev, chip_num,
> -				   TW286x_CONTRAST_ADDR(ch),
> -				   TW_CONTRAST_ADDR(ch));
> +		ret = tw_readbyte(solo_dev, chip_num,
> +				  TW286x_CONTRAST_ADDR(ch),
> +				  TW_CONTRAST_ADDR(ch), &rval);
> +		if (ret)
> +			return ret;
> +		*val = rval;
>  		break;
>  	case V4L2_CID_BRIGHTNESS:
> -		rval = tw_readbyte(solo_dev, chip_num,
> -				   TW286x_BRIGHTNESS_ADDR(ch),
> -				   TW_BRIGHTNESS_ADDR(ch));
> +		ret = tw_readbyte(solo_dev, chip_num,
> +				  TW286x_BRIGHTNESS_ADDR(ch),
> +				  TW_BRIGHTNESS_ADDR(ch), &rval);
> +		if (ret)
> +			return ret;
>  		if (is_tw286x(solo_dev, chip_num))
>  			*val = (s32)((char)rval) + 128;
>  		else
> @@ -832,38 +861,45 @@ void tw2815_Set_AudioOutVol(struct solo_dev *solo_dev, unsigned int u_val)
>  }
>  #endif
>  
> -u8 tw28_get_audio_gain(struct solo_dev *solo_dev, u8 ch)
> +int tw28_get_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 *val)
>  {
> -	u8 val;
>  	u8 chip_num;
> +	int ret;
>  
>  	/* Get the right chip and on-chip channel */
>  	chip_num = ch / 4;
>  	ch %= 4;
>  
> -	val = tw_readbyte(solo_dev, chip_num,
> +	ret = tw_readbyte(solo_dev, chip_num,
>  			  TW286x_AUDIO_INPUT_GAIN_ADDR(ch),
> -			  TW_AUDIO_INPUT_GAIN_ADDR(ch));
> +			  TW_AUDIO_INPUT_GAIN_ADDR(ch), val);
> +	if (ret)
> +		return ret;
>  
> -	return (ch % 2) ? (val >> 4) : (val & 0x0f);
> +	*val = (ch % 2) ? (*val >> 4) : (*val & 0x0f);
> +	return 0;
>  }
>  
> -void tw28_set_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 val)
> +int tw28_set_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 val)
>  {
>  	u8 old_val;
>  	u8 chip_num;
> +	int ret;
>  
>  	/* Get the right chip and on-chip channel */
>  	chip_num = ch / 4;
>  	ch %= 4;
>  
> -	old_val = tw_readbyte(solo_dev, chip_num,
> -			      TW286x_AUDIO_INPUT_GAIN_ADDR(ch),
> -			      TW_AUDIO_INPUT_GAIN_ADDR(ch));
> +	ret = tw_readbyte(solo_dev, chip_num,
> +			  TW286x_AUDIO_INPUT_GAIN_ADDR(ch),
> +			  TW_AUDIO_INPUT_GAIN_ADDR(ch), &old_val);
> +	if (ret)
> +		return ret;
>  
>  	val = (old_val & ((ch % 2) ? 0x0f : 0xf0)) |
>  		((ch % 2) ? (val << 4) : val);
>  
>  	tw_writebyte(solo_dev, chip_num, TW286x_AUDIO_INPUT_GAIN_ADDR(ch),
>  		     TW_AUDIO_INPUT_GAIN_ADDR(ch), val);
> +	return 0;
>  }
> diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.h b/drivers/media/pci/solo6x10/solo6x10-tw28.h
> index 4a8ede3139a856..a0feed7cf3ddee 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-tw28.h
> +++ b/drivers/media/pci/solo6x10/solo6x10-tw28.h
> @@ -44,8 +44,8 @@ int tw28_set_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch, s32 val);
>  int tw28_get_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch, s32 *val);
>  bool tw28_has_sharpness(struct solo_dev *solo_dev, u8 ch);
>  
> -u8 tw28_get_audio_gain(struct solo_dev *solo_dev, u8 ch);
> -void tw28_set_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 val);
> +int tw28_get_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 *val);
> +int tw28_set_audio_gain(struct solo_dev *solo_dev, u8 ch, u8 val);
>  int tw28_get_video_status(struct solo_dev *solo_dev, u8 ch);
>  
>  #if 0
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> index 91b5c416193036..dc79f88d17567f 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
> @@ -774,6 +774,7 @@ static int solo_enc_enum_input(struct file *file, void *priv,
>  {
>  	struct solo_enc_dev *solo_enc = video_drvdata(file);
>  	struct solo_dev *solo_dev = solo_enc->solo_dev;
> +	int ret;
>  
>  	if (input->index)
>  		return -EINVAL;
> @@ -783,7 +784,8 @@ static int solo_enc_enum_input(struct file *file, void *priv,
>  	input->type = V4L2_INPUT_TYPE_CAMERA;
>  	input->std = solo_enc->vfd->tvnorms;
>  
> -	if (!tw28_get_video_status(solo_dev, solo_enc->ch))
> +	ret = tw28_get_video_status(solo_dev, solo_enc->ch);
> +	if (ret <= 0)
>  		input->status = V4L2_IN_ST_NO_SIGNAL;
>  
>  	return 0;
> diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2.c b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> index 35715b21dbdffc..78cd07a800818a 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-v4l2.c
> @@ -410,11 +410,14 @@ static int solo_enum_input(struct file *file, void *priv,
>  		if (ret < 0)
>  			return ret;
>  	} else {
> +		int ret;
> +
>  		snprintf(input->name, sizeof(input->name), "Camera %d",
>  			 input->index + 1);
>  
>  		/* We can only check this for normal inputs */
> -		if (!tw28_get_video_status(solo_dev, input->index))
> +		ret = tw28_get_video_status(solo_dev, input->index);
> +		if (ret <= 0)
>  			input->status = V4L2_IN_ST_NO_SIGNAL;
>  	}
>  
> diff --git a/drivers/media/pci/solo6x10/solo6x10.h b/drivers/media/pci/solo6x10/solo6x10.h
> index 126f6fb7b755db..baacf99141aba9 100644
> --- a/drivers/media/pci/solo6x10/solo6x10.h
> +++ b/drivers/media/pci/solo6x10/solo6x10.h
> @@ -333,7 +333,8 @@ void solo_motion_isr(struct solo_dev *solo_dev);
>  void solo_video_in_isr(struct solo_dev *solo_dev);
>  
>  /* i2c read/write */
> -u8 solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off);
> +int solo_i2c_readbyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off,
> +		      u8 *data);
>  void solo_i2c_writebyte(struct solo_dev *solo_dev, int id, u8 addr, u8 off,
>  			u8 data);
>  
> 
> base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
> -- 
> 2.51.0

Reviewed-by: Ismael Luceno <ismael@iodev.co.uk>
