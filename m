Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321A13EDE60
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371485; cv=none; b=l8sBLrrParscs9KasONutnd/EuVDyfKv4jvuWolD1TyvAFTa96rS32Sz0E40/yY4MM/dAQZCaxSTHoF4gOgjdgfVBZMZcmKfck38dK4Jw6zO0WO/RXr6y2nckDrXgFMTdIYGfZ1dQGY1U+PDbzZqTvQCm7RUIeZQ5x3r81TxNSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371485; c=relaxed/simple;
	bh=6UCbS+9HBjPH+ly6SrFz0DNteyZrAFKy25237yQ+dHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guZl+o8NtuZU3eKTSo4HhXn2EpyMQLsvL+hysSBMxEWqI1vyKN1Oua2axCbTl+/FDHqob3r/dZ/hoBMNqs7J5hsOL9RPN1IeUYnzbq9Wp71mJMj12MYDUufLLEkK5odHc3ssNuE3rxSx6+8VcCaPQqebus9gnpE42k87gdTpZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uzpLxZ9M; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uzpLxZ9M"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c15bf5000so8786351cf.3
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786371483; x=1786976283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5kLAJvK86TEuX8U055kdZhFrlrED4hgi1Ae4CsMpXk=;
        b=uzpLxZ9M2ezjueuFGRDrLrQgmBiGfntCJHiCK+3ySkVfrOxbJl0md3JvCv+EcSNJA2
         shSxWO1/cxSqI1mF5zMFh6FXGJROGkEDUE9xpsrG+WnLXaDzmaF8pWrhD3GEhLZh819b
         qfsfb0G91LHFv2G8OWP4UvwO16D9xvZvD/CRPVhrQR6DfUlkCDFjlh0DZtx1/no+KLU+
         fkFTSsNlpAMEUNhVlztCzHol/Kae+g4owPHMmDGsFmp+i3cLdggEp8oT2tsx/eToB4nc
         jGzNqgV6nq59iP5cgI9hAQGYsoy8iaVMaPaEnz6sjpoZ7cqpWj6m275MTY1/Yn9jk7eq
         bJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371483; x=1786976283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5kLAJvK86TEuX8U055kdZhFrlrED4hgi1Ae4CsMpXk=;
        b=OOt7mwMgq9I9BWsPILZRGtHy5mo961pv0KtPe5P4eqZ26B1gN4wbrMAjbw9Qqh0Ccl
         amTZQP2uIacsVsdvABnnRlY1hChv87fQSeHoWJeZYncA7sILAwdnTb8z5szvvzVhMiF9
         MxuXMT50KoeuRNu7es635loRP2JHDRxqgb1oNNF2+Yk3LiuVUMEClx10ev89EihesQt3
         9Mu0PgrGuPcZKVhAFAxJELDTh+bJpG16hoUVBYlPp/pT1+x+PuCffXELLNOrxLm/GQKx
         MefcBM0xh+d1XC+lR8fq4GVSrrVCNBl76E6Uu02PJ4uI45ydHFyrAYMIVXmxJvl4smYQ
         tykg==
X-Forwarded-Encrypted: i=1; AHgh+RqDHBNuqCvCytJ/LWurN0zTnSzZmT3L0jOTP7ht9IwfIOx/xAdeYi5zNQhsWCkXehLckRAdCeEd9TsL2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4vLPs5nh9pK/ExyAOpgWOKOkfYl8+ZX4AMxiqp2tOBXIcV4t
	lFvzc3NDQzxFqJtpRkaN6GRz2cEu9rCvGLqeVvLbvnSZRPcKNw7w+oSPYd78mwNVrw==
X-Gm-Gg: AR+sD13vysN1AUoR1m+nt317fLmABuPb1y381hyXqeEEdG7fBI7ZAvuQjjk67KKT5T/
	SZf7hM3GzoIAeStLlOk4h1lKnMydwDcr955P16XyboSGrcZm9a/RHEOVzAAchqDjt1oCOqwpiWZ
	e6+QVNSTv8T8EmGBd0dznqJucpffIRtn1NaujaGIogV2O3NDxvIA8Q1Fjp7mLKvwCvojKq0ME/C
	qM2L4JN1fRlqUkAZ1aKkw8iJYsOeEMNNwzLUXJNdZm3DotpfaaYF066wdu7mFdJ4GCMWr94Qxr7
	xrlQgl2rjYReCgmTwgHaqeLeU9FkTOiLL23ZRsXAWxCdrO39re3a1oqZ8CPT6elLLcIXvqRpZVO
	PxM67jE6W9oujEPOCPeP9y2WIrd58g09kCvqtZhaN1aFUHCp+PE5f+3k/KmX9auJrycKHrVNMJV
	p/srn1AYIfQxN+3syy9Hyaq49m+30Ly6e1enGGRuImGtpF3jVu7mhkNL1if1g6gt3GiWaEjDaD8
	RRW/9Q=
X-Received: by 2002:a05:622a:408e:b0:51b:f857:cf82 with SMTP id d75a77b69052e-52d4be1abe0mr23120741cf.8.1786371482940;
        Mon, 10 Aug 2026 07:18:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d16335094sm72374311cf.3.2026.08.10.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:18:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:18:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ZW Tang <tangzw515@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] media: dvb-usb-v2: gl861: WARNING in usb_submit_urb due to
 bogus control direction
Message-ID: <0608a6e5-2f77-4153-b3f3-a865c6deb84d@rowland.harvard.edu>
References: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA2SOT4pewLwoVkCDsT48QhXTbz_j5MZCuO1QL8dde4NGqtfDQ@mail.gmail.com>

On Mon, Aug 10, 2026 at 04:21:20PM +0800, ZW Tang wrote:
> Hi,
> 
> I am reporting a WARNING triggered by a syzkaller reproducer in the
> GL861 DVB USB driver.
> 
> Although a similar bug has been reported before, I can still trigger
> this warning on Linux 7.2-rc3 with the attached syzkaller reproducer.
> 
> The warning is emitted from usb_submit_urb() because the USB control
> transfer direction appears inconsistent:
> 
> usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 4359 at drivers/usb/core/urb.c:412
> usb_submit_urb+0x117a/0x18d0 drivers/usb/core/urb.c:410
> 
> This looks like a driver-side control-message construction or
> validation issue in the GL861 DVB USB driver, rather than a USB core
> problem. The reproducer creates a dummy GL861 USB device, opens the
> corresponding I2C device, and issues an I2C_SMBUS ioctl. The execution
> path reaches gl861_i2c_master_xfer(), then gl861_ctrl_msg(), and
> finally usb_control_msg()/usb_submit_urb().
> 
> In the observed crash, the driver submits a vendor IN control request
> with bRequestType 0xc0, but USB core reports that the control pipe
> direction does not match the request direction/length. This may be
> related to insufficient validation of zero-length or malformed
> I2C/SMBus read requests before calling gl861_ctrl_msg().

Many USB implementations of I2C cannot handle IN transfers of length 0.  
Some of the USB I2C drivers have been fixed to set a flag saying that IN 
transfers of length 0 should not be accepted.  The same thing could be 
done for this driver.

Alan Stern
