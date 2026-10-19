Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A625166EF
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419238; cv=none; b=jSs0IUACSadaUvJxqzRlWD9SDYqEVZisLi59agP6jGT+qgCtnq0fQNGvkzyiIQWVbNaXdJuqR+dmp/8v7jh8KYjP1frD1fDenMghWx7hZYBVp0p2AcUCx24bTKzI5tvVgDQGvmzs7F6xOO9eoHc81wR5ytT7K+1iDeaRrT9lw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419238; c=relaxed/simple;
	bh=Xj1tXuPgTXzaT3nix7piE0Gi8Q7+az0H1KHgxrxkFZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrQL3E7A6lzCUIFQqBJ0HG4eMP+YKJzY/LFKzn3177Yw1L9dVy0v3Yq2cYo7d6U2eJhWV6MiByedE+KDYBaPAdW3ejWBuVUQNtpNiPPhPdARKO+8PLXrTZNIiKW0hu8BsSG9i3eutKykB6+2lbU9AqBNnMJR7jjWtIWvEokU/IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YTFZ7HMD; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YTFZ7HMD"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53397554beaso25247991cf.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792419235; x=1793024035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BlttwcoFjB9LyfPGuIFgEh48duPPMU/zmrf0OZAJ0E=;
        b=YTFZ7HMD0+7eZ0cb4C8DJvhGaaAIA6s1oS0hIaYf7kL2wQRV+jZYSV9KxZGeBF8JS4
         TXVFnK+81s75jp2tm77iwoWJMVq1KL3zlwcfDoqcGKhxtGkwDxujOSW4mgcSfaoEGZiQ
         yQmxvhJTVl9xc6i/eDFIxsUkRzJlChX/LeXyNHXv08kbEZMhvdu/JmMGpfxj6uDwVRZZ
         8P3SSpVfZ+KE9tzgT8BL6MIQkgfPdyVxStqzrp3TDDL5YzFc7JiyrNibTY5g30HsOeRk
         iif9nlaAjJLNu73mXLR2QYHJ5oHAh5fz+OhUR1yCr8zn7AtNSKEaCounzi30FMfcpfGi
         mIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419235; x=1793024035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BlttwcoFjB9LyfPGuIFgEh48duPPMU/zmrf0OZAJ0E=;
        b=jwwo3U7I3RppSJe8FuaIsiYrwhE4fY4OfL4vniYK7UJjiLDzKyT99VtjublQepqNPh
         lkfk9FkUb1X5K6fUIRs9TCV141ZHBeSkHJ50ao0y+3sQR0poTJAmdaMsuWi7UaFOwV5t
         luVtCnZOoHgizMf9SI3nE1j1gUiBqVa/unDx3/jIKY3pTtdO0x70DQ3WynwjNJIGNQdK
         zNQh2nONqXFpshWbeFYL5CZRAwcy9eXpQKihFLCjdUigsKcWlyCKetmtZ9ZmXgzXeXKL
         uXZGbhU/KxPbZrZGkFb7Nd/AiGkiAVztvOy8XNg7BKJ3TtMtGmxjrbzFYK1un03kAJQi
         mDLQ==
X-Gm-Message-State: AFq9FYIIk5fZiVx12kfyCVuFrdRw/HE+zZrgGvear72lJevUdSrlURPc
	FmuSeiQy4/IJUhwF22L0w7A2an4TbbptnzeLTMhcSWJ+9euh8erlTWSUFab/b1aGHg==
X-Gm-Gg: AYBFou0LYqoP0Lzf0jG/aFV1niQ8iOOjrMycH0/mjlPqx7ThfvoeHJ2PH44rC9bIFZm
	sXEZ9KTq6e47/osdDllD+OJuKdhPP+EKsbjBFTw3ZQXU7OSnP+7GAFrKGcr9zKvgOiaIQtRmpkS
	LGsf+rlv0Vd2Ru0M1wvdS5Fe114BOwVnTzT7TwDM832w6E3ZWMmRVD2jaqcqIF5LtY+LlRGEzNU
	hpV/XS9HlZ5T7+GV5Oh03aBnb1GvaSe7AZNtycQgoMjKU4R/zQdUNLPGs9wSXwnvh3yc/niW0hv
	D8uJvwzwTDv3niYzW7e69TT2au3+CbEN+9lSmQ3qt+M0+JQuh6HuZh0PWKCbf/GdJjWTkryNLCa
	WwPMZmBYQgawR+RsHwBfA8Zo9qYw+IUqaUUMg6/W6UQlDdMQvk6mxiL9J+Cld+Dh0girZ0usT9k
	n8PDCKhDEp+0CQv/T1jN6ZGVuVivYsmSdRbzXjo7TMEVg+CZqhMNMolLbr2EpZXJyZVy+puqv2e
	R4UOO00YBszQv8vf0uDRUOiA1M=
X-Received: by 2002:a05:622a:514e:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5364605937emr109597891cf.44.1792419234421;
        Mon, 19 Oct 2026 07:13:54 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e43cfsm99785331cf.5.2026.10.19.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:13:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, stable@vger.kernel.org,
	Antti Palosaari <crope@iki.fi>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: dvb-usb-v2: ec168: Reject zero-length I2C reads
Message-ID: <1ab79363-7211-475d-8529-1d5c00586f8c@rowland.harvard.edu>
References: <20261019123542.4040472-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019123542.4040472-1-andi.shyti@kernel.org>

On Mon, Oct 19, 2026 at 02:35:42PM +0200, Andi Shyti wrote:
> ec168_i2c_xfer() checks the length of the register-address
> message in a combined demodulator read, but does not validate the
> read message length. Userspace can supply a zero-length read
> through I2C_RDWR.
> 
> This reaches ec168_ctrl_msg(), which selects an IN control pipe
> for READ_DEMOD with wLength set to zero. The USB core treats
> control requests without a data stage as OUT(*), triggering the
> "BOGUS control dir" warning in usb_submit_urb().
> 
> Reject zero-length read messages with -EOPNOTSUPP before issuing
> the USB request, using the existing exit path to release the I2C
> mutex.
> 
> (*) is_out = ... || !setup->wLength;
> 
> Fixes: 2bf290be4f3e ("V4L/DVB (13364): ec168: add new driver for E3C EC168 DVB USB")
> Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ed3ada41c4eb1c4ab78e
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: <stable@vger.kernel.org> # v2.6.33+
> ---
>  drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
> index 973b32356b17..f6b98c7d3704 100644
> --- a/drivers/media/usb/dvb-usb-v2/ec168.c
> +++ b/drivers/media/usb/dvb-usb-v2/ec168.c
> @@ -115,7 +115,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
>  	while (i < num) {
>  		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
>  			if (msg[i].addr == ec168_ec100_config.demod_address) {
> -				if (msg[i].len < 1) {
> +				if (msg[i].len < 1 || msg[i+1].len < 1) {
>  					i = -EOPNOTSUPP;
>  					break;
>  				}

Isn't there an I2C quirks flag to indicate that 0-length reads aren't 
allowed?  Setting that flag would be more understandable than this test.

Alan Stern
