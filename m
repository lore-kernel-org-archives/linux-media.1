Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC055C30F
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092522; cv=none; b=CIu816N+acB3TiGHPqoIzuWdloU+RfxugzWxqsZCDCP4/fFqq140/scK84xUZq+1cJLh9KnC0qvwZlFiOL5YgNDRYW2TNX2vqNCpca5NsEZQDjTkIVZbF6zuLaLQ7pwAIQIL8O67J7++UugqRqW0PpumyGdQh4dj5s/qRjISDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092522; c=relaxed/simple;
	bh=O/XKhBPSPw8VpToldZQDC9S0W/Ab6wH3IAI+SN9L3Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5eFxfK/0MjyYqqUTAQwIJ9Hi3EYNf7PY3TOfyNm9YzAFt8BVxODgYfRYTWtRx+UJ83W8u66hYCNAXLsj3FQrthPaw1d1zySzK54NkdZusWeR+f+2Y3VA1EX7Ztavd42vjXDEolTvnUuCi7UpYhq7WFTALsRNRtiRdqL9KjClCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JLjS4i+S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JLjS4i+S"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C81BEC25;
	Tue, 22 Sep 2026 17:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790092405;
	bh=O/XKhBPSPw8VpToldZQDC9S0W/Ab6wH3IAI+SN9L3Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLjS4i+S5EGH+aE/RijRpsH0Bk0ZSyO/wn4mJcoAt6vyiaodlVJmff18ibdhISukE
	 ZzjsxMiLAhNY4s5JRCwHtkMX4V9/kWAssvxSli71fBzk0Kx6i2SAeVCdsp3+9Qo6an
	 B6g4JyoKQYV51qaJ/dYR5uP7Q9IHKUraAR57dl80=
Date: Tue, 22 Sep 2026 18:55:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Subject: Re: RFC: Remove gspca and old ISA radio drivers
Message-ID: <20260922155509.GA2471124@killaraus.ideasonboard.com>
References: <8d8203ba-a406-4730-9493-dbab8b3ec831@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d8203ba-a406-4730-9493-dbab8b3ec831@kernel.org>

Hi Hans,

On Tue, Sep 22, 2026 at 05:37:03PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Would there be any objection to removing the gspca driver for all those old
> webcams with horrible quality and that nobody should be using anyway, and
> for the old ISA radio drivers where I am pretty sure I'm the only one that
> can actually test them (and even that is questionable).
> 
> I could move them to staging/deprecated for a kernel cycle, but to be honest
> I think we should just kick them out.

No objection from me. gspca doesn't bother me though, as it's quite
self-contained. I would be happier to see the em28xx driver go when it
will be time, as it's one of the few users of some legacy subdev APIs I
would like to drop. As far as I understand, that driver is however more
widely used.

> It also allows me to throw away a lot of old hardware and make some room for
> new hardware :-)

I wonder if some computer science museums would have an interest in
those. I suppose they're not the most interesting devices.

-- 
Regards,

Laurent Pinchart
