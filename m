Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4C238D3ED
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122472; cv=none; b=NGc+NsuFXIR64g9sGwIDbpMjKmim1Ker/eua04OIqiJoo1FLjhbmqskSvqz3WG0JDqYd0oZm00tsR6WSe8CnIAvTGUUrmj7dfAt2X1sedprbOWwlthaxSCV6MOy9B86AfKAyA7jNE6Lb4zQ11f4IvkVAjZ3FLtEycSc8U/nWnLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122472; c=relaxed/simple;
	bh=Xjix+ezDww45fiSmmVE27IMAovNtEODaJjUP+svzGog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnPHZNVmU+0lJWCmMcRo39iupRaq0ufyayuxD6PaNhetIqF+wAW+BChBGw25grla+nZAOiTWf/cDdb5Dok32bgNmqSgsDPu3Y5u2Y1QVCdgcMPGtX2cCdsDT4dF41Uog89azPTLcxuzskr5KO57qMqqmZ1HgvUf5lz4eOjJ5TeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KN/PgWP1; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN/PgWP1"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930fad20240so182747285a.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122469; x=1786727269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Dm90l7NZdmGx7A2pHb1IyR/aqBOb4q6n8ufqhFP+ZQ=;
        b=KN/PgWP1dRYXULpvscIY9IfjoqGEhe439xOFf18KfAE4Ahqg1EZNGcGJ3QYa8B4xrW
         vj0q4nhFIqDZePDkvlkFC3VNqKIkRVeFzVgEY2+bq59B3vuu6dzNmDxRmrqE852BjJ+6
         Rh62lqRMGlL23xg5cDGWRLn3S3hjPi7ImSlimUKxId2yxnpHICkk7Q0hObNUoOnp76Q/
         Z8QEnS/0gTkb1S3z7dL0f3iYbqxJFi2Za63KInbGDok648KV/75+uxk2D4tSEmDS93Bf
         3ILZyDlTO60OFTMkAJFi/c+CEc1KvETkLLUcoSwwU73nJC23rPP5prG+jyjkrXwuIBgd
         +1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122469; x=1786727269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Dm90l7NZdmGx7A2pHb1IyR/aqBOb4q6n8ufqhFP+ZQ=;
        b=ZWdMeu5dVPIMjqxzcovuXVa1MXe2Ikv5U33gBg7ulOui68vrUMPANx8rYhVfosMHkX
         3bvfw9zScJE/+RUASKdxv0qBUC3NkF4BPY14pCUe5i8CUulIusGSjmsceinItx7wtbtC
         LMmivQPZgmba9FJVesNETvb8WeAABMFWCNW1RAhLXkPO9odBrBQmEfX19pHQjGUHPI4U
         wwQMaBq1oCdXO4aVWfY6tkaApNF3wQyvRARonjgoglz4BpAdbt2o0Ie4IPCjrk5G0VHp
         R6CdFmwvn+1UAoD9HobehsgOe240Z1yJHMcebocCdi5xEuGreRdxtMPnP4fzcPamz4Iv
         nozw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+YYd8db0BqVliWbBOZLfalu9Tl7lXQzicZtPhp17wO0PO+GCMGXqOa401SNX3SyMe4kG4HMuhUZAh4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hS01T1Ym10RYcO5xHx/nj85aIfToWRFYnwlBbW02oSUMgKOb
	rG1n9D1NM/B99sih/oqOEVlGDxWcfIfprnKCa8aIqAn6iodjFy3OCwmPKys7FDDJvmk=
X-Gm-Gg: AR+sD11QjsBaXbwt0OQt6sM6mfDnKSpbqYqChg+yhyEA+Pq/b7mnyZpzXE1CIRV3ZDB
	OO5vBH8PvnRhR4E1MCkZTWNo1i7F8xM65rQVcoTfc2iFQyDTVOF5uX0qcGUqIBaZVF6L6GBpe9v
	vZkq6xd66ARilt1fTL/aD3fEST56qwRvkRU9nh6x1D7BvUHbo5IUgQD0x5y6sowpNN/5fWrWeNV
	skQ/oAXsyDuzXEmerEs156wekzxUMX3zHPZgpfhN3Sj0nihRaMOzDbd5o7R2msWC3jta83/tCLS
	Xi46dxAKnShOV43z+pnR5xB+jqgHjmUELm5o6xPNqyehJ+wiy80yzDI7gJou/whDA/tweGLP/w/
	FbGrg54muzjMzj1rj+fuT3EkrqmAUzI6jhbiB/binGoDnWQGdd/klmOz8AY9kPcuQiWPhN9oFyy
	0bygomHErvcTLyz+kdIDGrgoHaT+3o5TqEkQ0VL5qU+6sdQ+hJcM/7bg==
X-Received: by 2002:a05:620a:a403:10b0:92e:4859:49dd with SMTP id af79cd13be357-936490e7540mr2021484685a.26.1786122469163;
        Fri, 07 Aug 2026 10:07:49 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03aeadsm191761385a.3.2026.08.07.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 10:07:48 -0700 (PDT)
Date: Fri, 7 Aug 2026 20:07:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay299 <punnaysharma805@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: fix sp8870 initialization and
 hardware communication
Message-ID: <anYQ3cNFJp-YCqLr@stanley.mountain>
References: <20260807160149.41580-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807160149.41580-1-punnaysharma805@gmail.com>

On Fri, Aug 07, 2026 at 09:31:49PM +0530, Punnay299 wrote:
> Address multiple correctness issues in the sp8870 demodulator:
> - Fix BER reporting in sp8870_read_ber() by correctly ORing the upper bits.
> - Set state->initialised only after successful firmware upload in sp8870_init() to allow recovery from transient I2C failures.

The AI is too vague on this.  It needs to be spelled out more
specifically.

> - Catch partial I2C transfers (err == 0) in sp8870_firmware_upload() and return -EREMOTEIO to prevent silent firmware corruption.

Run your patch through checkpatch.
Do one thing per patch instead of three unrelated things.
If it's a real bug it needs a Fixes tag.

> 
> Signed-off-by: Punnay299 <punnaysharma805@gmail.com>

Use your real name.

> ---
>  drivers/staging/media/av7110/sp8870.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
> index 29fb4934c..def2a7f0c 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -68,7 +68,8 @@ static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
>  
>  	err = i2c_transfer(state->i2c, &msg, 1);
>  	if (err != 1) {
> -		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n", err, reg, data);
> +		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n",
> +			err, reg, data);

Don't make unrelated whitespace changes.

>  		return -EREMOTEIO;
>  	}
>  
> @@ -135,7 +136,7 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
>  		if (err != 1) {
>  			pr_err("%s(): firmware upload failed!\n", __func__);
>  			pr_err("%s(): i2c error (err == %i)\n", __func__, err);
> -			return err;
> +			return err < 0 ? err : -EREMOTEIO;

I'm pretty sure i2c_transfer() can't return zero in this case.
It feels like this would be a bug in i2c_transfer().

>  		}
>  		fw_pos += tx_len;
>  	}
> @@ -315,7 +316,6 @@ static int sp8870_init(struct dvb_frontend *fe)
>  	sp8870_wake_up(state);
>  	if (state->initialised)
>  		return 0;
> -	state->initialised = 1;
>  
>  	dprintk("initialising frontend...\n");
>  
> @@ -353,6 +353,8 @@ static int sp8870_init(struct dvb_frontend *fe)
>  	sp8870_writereg(state, 0x0D00, 0x010);
>  	sp8870_writereg(state, 0x0D01, 0x000);
>  
> +	state->initialised = 1;
> +
>  	return 0;
>  }
>  
> @@ -401,7 +403,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
>  	if (ret < 0)
>  		return -EIO;
>  
> -	tmp = ret << 6;
> +	tmp |= ret << 6;
>  	if (tmp >= 0x3FFF0)
>  		tmp = ~0;
>  

This feels like it probably is a Fix.  It would be better if it could
be tested.

regards,
dan carpenter

