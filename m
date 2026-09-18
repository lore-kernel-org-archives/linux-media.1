Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3451475A
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748170; cv=none; b=JQ6FZUe6txHaOEZIiPhfCEcy9G+EPQjFiFTohLfuyL0KACXyOGesSS1oeTvfNBd6aqv/Wx14kzZuHSo5F8tY5mvYGBnS/xR3xSkCThVkIKb6OFH7/y+UtQr7FGdyCo+JmOXRFF8R7SFEfK9YDvMyUmJwp6DFKLqUFu8Vhp2XpYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748170; c=relaxed/simple;
	bh=BgZt53WCvRUv+SYL6NxC16PIrmwhlpA/RGPQ9pKg+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ovry1NOY+sUp0N0urI1eZbTTNcqWEN9ufwfbuapPYGBm050hK4kKmTS3CE2fC9iwrnw0bHFHGvj/jjM9qWsMcyqjWewlJsZ3AJHDcq64LCo0AYm1X9By6rEgbE/4r/uLX7sL1754iVMUQdJ6YM1xoW14673hu56R0OrnTiUsasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6RhnrnQ; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6RhnrnQ"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so615684f8f.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748155; x=1790352955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=W6RhnrnQlYRgpKI8L6tX5vifGm9N/jUjaw+bmCd1h12VFiVZIfbBKVPLLvL4LD5zj8
         U9W8IdryhSqBLxVyzd3imBwpMHkisPgHz70W1+VXZrXC+hXX5YXkzNw26IbBbVJlLJJE
         6YVtV1Fjw/ylXwaFDAj1NVKiiUCvfFpdHcouunB4iJ/Qybus7crwxAkoZMxJP27tfVcs
         44lDAp4T0LL0mWu22PeadWmMjLn/RRaSPKFz/6eoLHO/d/LHzFP24PMNO42ZmN+UfAkM
         ySPMgPny54Xn7oLoA82lXwoVVaVQ33lLLF+57L44+E0ZpF13faK+zVApJbzhWrC3POp2
         SEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748155; x=1790352955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=qRDS917db3dpI2OV2XputCP45uiPQyUrwq/HiVnhB/vZhds1Wr8jreHKXhbmADmNs7
         MF70WwAUHgR6haGXj5sBL9M3O4ehjTSV+u5ll6feh8LnZwTXqRAREub0PIw+uJBiTaTs
         UDg54h5e4sbC3gsPh1GTlgUUG842M2BUM6dtqKEvcmeLBi+ZdOMevdXkeKObMaujm+1V
         CuLr6VZjoMkd4h9R6O088asEPG8qTh2gP6YiqKEbXsE0pVowlMEwVy5iLfjzUgD5wWgE
         hRCB7nw0U0fvJAadaGS6BWDl+RStybvpLJr+quIEGdlkHhuYIN64pnUZD+Zh62skDnK0
         hx8g==
X-Forwarded-Encrypted: i=1; AKwUvBz0QB0PMl2m6ebAEthBVOwc/m74/GVLVkMNzcLldcq5Ty7dujt8B/8Ec3eiPQjtkj6+65uCiiNHnGkgSw==@vger.kernel.org
X-Gm-Message-State: AFuF++nGaIr1FGGyLe4BguDA5FoBKr9QdHW+KKwj8905MMwlbB4hA6dJ
	2Tw0kS6rlLVFGcpDR30dPCTaACjMxBaV9epT/Sc/W/71k6rTQaIxF6en
X-Gm-Gg: AYBFou1y5f+ku0xM6ldxcDTAtK4P7oGzlENrYjfaAB4AdzNMjKi+oXlBpkk3923Xndg
	GDN5bObQbN4BSltQw4XN6P+eMPWdhrSRHsF58UwM/DpLM9HEzhkJhd0VKREd7P+S8T0Hv6G8rhe
	eToTBcvyu9cRvM8+AKUii2mp8SY949bcnNAwt6g/BegCJXwkjcvxl36BLj663/z3DvY8Q2MChZb
	iYcP/4N8EsABTW2J0HueMEUenvjeNIV4/g1ieXbFcdZ80G66an6CiCuouX8KLEivlZHRBgqxs/k
	Nsk5MeXf/7v3HHGr/EtDWbyHRKft6anjgn1+WPH+VGOM7D49hnEnjLNqzP0N7Ma0WBGpMc2oOLB
	izejiTnJlXb5eOgvxx94425OUbaKG7K2YdixCLgA9r3w0JrSJ3Iq8WOZq2wXg1QubsEXDYqwRjP
	O0lEX/xh7Z/5pVx9zw/4winoonft0wkKEbT8GXPUT8mC6XaMaeHODEJL28tAf3Opk/siq9PnRv9
	xZJOA==
X-Received: by 2002:a05:600c:354e:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49fc57226c9mr37347285e9.12.1789748154818;
        Fri, 18 Sep 2026 09:15:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm44136965e9.0.2026.09.18.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:15:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:15:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq1jtSc_7Ad4v4eN@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
 <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>

On Fri, Sep 18, 2026 at 03:46:11PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > > Hi Dan
> > >
> > > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > > already doing bound checks:
> > >
> > > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> > >
> >
> > The problematic caller is uvc_set_le_value().
> >
> >         value = *(s32 *)v4l2_in;
> >
> > Smatch thinks that is called from uvc_mapping_set_xctrl_compound().
> 
> uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
> V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
> think we are safe.
> 

Yeah...  I have reprimanded ChatGPT and it says it has updated the
warning review skill.

This is difficult to silence.  But I'm going to ask AI to create
an tool to automatically rebuild a second temporary database which
only checks the problematic call tree and points any impossible
constraints.  That would have flagged this warning as a false
positive.

regards,
dan carpenter

