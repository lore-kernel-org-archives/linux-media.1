Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761802FC037
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128405; cv=none; b=HGhiNO76WOj+Lyq18FSPWNER0xyT7zKn3BV+aKPDZxhAorc36GtNdE3WnRt2VF2zGnngubt+mgSZkY5r29G+HzpQ0CIGQBpiZ92tmgI3YvxSoAoMAvub98w6mOFCxtsl+2t9ZHMjpfDROHo5Iov5XgSeG8+EnC3TT2+FikW0Cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128405; c=relaxed/simple;
	bh=Mt1zmwVvL7C599yV/V47xybzdFZKP2OIiGG+KWvil4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWb+i6OYSUmnutdIX1OFy7y8LVwUZwwqBVSifdzTi+Lp3Ag3TeQQTYoly2n143VENGpxcsxX8W7YcLgICh5NrAsja613D6plo8nHZ9hohwivjOMvmPJj6/bnfhLQffi2XcsQkswVIbAv2B9Sg90Nr9ukJ0sIxaKi8NmLPf0bbNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItS/uDiw; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItS/uDiw"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed19f4d60so155022185a.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786128403; x=1786733203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eWr9SPLv59B6erYan06Zql1/BzjBsoX4KKVRypzN09g=;
        b=ItS/uDiwFDNoRaD599irdSKwSscxAVY3H9XJ9NJocfi9o1uuhyfesu2+7+QBE0LSAx
         r71yd2IuzLABzUpLhipT2+Uc9+yB9u2baQr2Sp6yEHd3LKFSGWvl8199JJX3BR5Ol5yZ
         3ZSmrfVLoXg0vnsDSgMKLc5I6Qc2/3E9crwuCN+RojlZp7t+RiOrAAcBLIlKt+cIuNMd
         ZcqVeU0AiXIAN8hFX1qCja7ZQwUHeooEaBd1HFZWChuiDO0avUsNLe1ypfIrPtAp/GFl
         7u00JaASipA98kjBVoaJjpjz0XtNMPaGk23z+bfATMlNRJZ7CtLonJ7NvBWMnXS5kp+F
         9xWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786128403; x=1786733203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWr9SPLv59B6erYan06Zql1/BzjBsoX4KKVRypzN09g=;
        b=aQ2WFE3eo3TV+xo2HnQ01WJSf8dgdm4OOkIzLEsr1tIFm2QyVS32+xNlSP06DMiO35
         ACiobyvqwbI0GOuqZrlLu639Fc2zke2EU2OE0lusu/nccBVnSlXJ9g6oEZICersbxc8w
         Fz6Xm/Oq4mjaByB7WekDy3yMhv1woUIGsPOQ8fCyvkRegNRqWFFrt+xJ3R09z7G9RccJ
         klDP5Ghw+EiXliONL3eVoBH2AIfMyJiZuiggO9Hk+nGDYC9vET4D1APCtyL1J2GYPy6H
         rUK8q5RdCOjg8UtNPjTtFJc7QNjw8oznL43WhsfqagNkaWdtX6jE1bN0wzvgwe7MuB9g
         fRbg==
X-Forwarded-Encrypted: i=1; AHgh+RqSl2dBhYMsIxL2C/W2lAbasO+LsUAJ+V4feDdk4v53e4mxZpxrC306KOk+3mVm3YbXsxghxWO8pfVV6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YynnngCL8+eFK3VGZFAfZpd+8PzG5A4Ub0XzfJTKbzLCJ02iCkl
	f/WXOFPM6eC63BlXpD7elNrKat9i4B83qW/dDlqsc3YQH91BEXu9CUsq
X-Gm-Gg: AR+sD136abFpFkfA7ErpQ5603bR1x1gLS98iss6YPHI6mxqU1JTodlOX7HmiWS/HH0+
	IGzDu3WMccVYSQatsi2+J7/v1bqR16IlYHu4b/QGISQ9nVspQr3ly0Uv+eCWvKpw5rdZ07+9BP4
	eduU7ot8Xa5bnfYX0s8qugC9YP+Ljb2lNvL4J21BNItv2nzEd5cK4gSnbM/viCwlywlgt4AKIWm
	4K4grQxBmv4mzDryPHbQpI1R03WrCbwlwKjD47HAStcdKzF9Z8CGc4vznPGGrWGy5Ut9UU9tult
	Pt9TNJOGgkwM69txF/niFhLoq2yrdghGmSowbQ0hBuTQbi4GUTz3QAHcwyVDdIOfr6rDkqpx/jb
	iknVVT/A+beK3of8/K650AmlBqnyTFOSy+W5rt3mOSLhEvj2evWGo8nvAl1WB3L09GwfLgRGxRf
	cyZI89IWyVyIs1anczmXO6+FrHOiJbcH3kbT6OlFzs9bz3dY9Tf8reUGPx2gfsYKGIPLpp22A29
	Fyi
X-Received: by 2002:a05:620a:1786:b0:929:f78f:6bf9 with SMTP id af79cd13be357-9367b672642mr91596085a.16.1786128403331;
        Fri, 07 Aug 2026 11:46:43 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e0c17fasm210195185a.21.2026.08.07.11.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:46:42 -0700 (PDT)
Date: Fri, 7 Aug 2026 21:46:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Punnay Sharma <punnaysharma805@gmail.com>
Cc: gregkh@linuxfoundation.org, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: av7110: fix corrupted BER
 reporting in sp8870
Message-ID: <anYoC44F6SrKW5iC@stanley.mountain>
References: <20260807183443.13912-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807183443.13912-1-punnaysharma805@gmail.com>

On Sat, Aug 08, 2026 at 12:04:42AM +0530, Punnay Sharma wrote:
> In sp8870_read_ber(), the 14-bit Bit Error Rate (BER) is assembled by
> reading two I2C registers: 0xC08 (lower 6 bits) and 0xC07 (upper 8 bits).
> 
> The current implementation masks the lower bits via `tmp = ret & 0x3F;`
> but subsequently overwrites `tmp` entirely when processing the upper
> bits using a direct assignment (`tmp = ret << 6;`). This logical error
> causes the lower 6 bits of the BER hardware metric to be silently
> discarded.
> 
> Fix this by using a bitwise OR (`tmp |= ret << 6;`) to correctly merge
> the MSB and LSB payloads before returning the metric to the DVB core.

AI uses a lot of really unnecessary words to say something very simple.
It explains the obvious stuff in detail and ignores the important bits.
It should be something like:

  Checker tools complain that the "tmp = ret & 0x3F;" assignment is
  never used.  It's probably supposed to be ORed.  I don't have the
  hardware so this is untested.

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

The fact that no one has complained in 21 years, probably means it's
not a real bug.  I generally ignore these ancient things.

> Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
> ---

There are a bunch of rules for sending a v2 patch.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Don't resend the same day.  Add a note to say what changed etc.

regards,
dan carpenter

