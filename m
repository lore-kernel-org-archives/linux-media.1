Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2442798EA
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974071; cv=pass; b=IsU/4hacuWtw+zjI2roTBGDh3mgwBZd5LjJdU3oGBtM2SB6q5NUQRnp+z4WpD+gUXf4tthbxWR2gtRk+AnDcDGysiuCpKQgf6jAlSg0Eq9OyQVzEM4BI4NA4XqOEC5EGxF2IwEOYFNKcs5vtdcU4Np8w3gZI/AHCGJAmMnSY7SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974071; c=relaxed/simple;
	bh=LccJHv51dWHfTmazwdGiPtOxYE5F4fFp6PNdP0l+77o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAXaTy+EI2Ic/8ORW/rx2RaUFOpp3xs4fH2oXOkco2NlRKX6oShHS9OUVlUx4WV8+TsxrHLZiDCLVUJwwK8ih3KV2sdD29yyoay+TdCMsV1X+scWtuNKdHOfRVEV/ovpOlVO4CQFmsrThU0h7Oy34oGr6G4k/F1+WPpew4Rs8X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI0WLstc; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI0WLstc"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so3403009a34.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 06:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786974065; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+IwRjBQNkjlNqCu9tAp0ylVKEAdT2qegI+2V8OhqbdYNU5hRqnKfyugVykbAutq4t
         m6ACCvl644kY49KCk7+8/Wdt3tpLAnaS1LptaHif8FNkMj8ysRTlmNRo6AoetP4xldGQ
         SL/T2pLiEyLIqugIMxSScuQpSPtuZlFsFk+YcmVpZMup9h5Kuc4um1vhBuw0+kg5jWV8
         TH4wRNy8UE4qZLp19QG97x//aBlE8t0RHuHmCyO3/BNKpPQN1a/EeeYRwDPwvclvYe73
         Gyq8qXPQ0uXsZDxUHKi2/vYM0C38GiP6aRDltzMI4glxzUPOApLIeF/dgOYqzduhQ07y
         ylug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oDTS9dNSi8/M/pYr4xjwQbPNngmswF+O1PTtSVfQuX8=;
        fh=g4FMPZwzHCc2syk90Xa6SbrPfrWcD3S3bFxjir8FJLM=;
        b=VlK4VtcLvPTTb61uMZZZt3uuFGnVtIsNdFPTE01KD5PHzgQ1zJdvhMq8kfxwbd6rMo
         bOrcXse3NLXE0EqCp7b15bvLLVY4JeZo7ely1kx83iRMNMOnr0nu3QE7PZKzilNW3/jA
         GsCK/Hu40/UljsCUYrvvOA3EXkWOPSd+kgTu5rPXjEi0u6J2VMRqRXjfGB9GCftf+GBo
         KlaaxnRTNnld9PN1hzxNhLn6VmklRHqCxlKG+limLKiqIegaUFX930doyeuNFKiw/Z5F
         F3UJwtFwcb08mguQASXCTnvdH9Wg1ga6U+PEeTKg2TQ+jbELx/AAqjdlGCE3kZzHIMVg
         IocA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786974065; x=1787578865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDTS9dNSi8/M/pYr4xjwQbPNngmswF+O1PTtSVfQuX8=;
        b=YI0WLstcjecGun7YCagn2FYgjw3+zs1jjMFE5gEIlRqMJG6cTLT78Z/LPprQ8YJVd5
         oryrflmEQBsURJDhZUk9Jr7kPu1oAGNduzP0+j5yWu9XfCOnElbG7W34PLImxFXyZ6GB
         yu4/v7yUpZWbt7NZYhi0s1fT16c1PM9HWXcxDdZOyjwiOn3mz7fSPjh+iPu7CLPOPhOz
         kKIbK2RonvSJvg6GRsY2m+Y2g0Yl4+SEkDxsXgAUZg/NsrutODpkCVCPw/QmOS9M9S5z
         mCEK5VAJTkfcm7kgaxU9FNn8P+alIgvqsH17hbfzzfecjCo+mC4o0eSRxDelZam+A/Ln
         ts0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974065; x=1787578865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oDTS9dNSi8/M/pYr4xjwQbPNngmswF+O1PTtSVfQuX8=;
        b=kwHJUfohWlEQKeTxPrvkfJ8+6DnZvBDbKSxeW0y4BuFdG9bo5deXAeySHks3ImE4Xe
         kXIw7xijbg7fvs5dw8HS78nbdI/VAmgyavN4/FT7Q6qFIFsNgXJP+QoOxBYbAcBLEPY8
         R1fuxmpwyNHpKJrYdxwCnE/dYQzlZeL7oj18hIb8Xha5Y/ttTAiQf/yV60MxvsWrk1da
         lxJJIDo0sVHRWPUXhb+DofRVLVvgMYShUOirk4wNlyzUIxuhomRQtPRjWk4PFd9NqMWs
         9DhayleOmnfu7GJHSjiw1ntiDkyJx2Tnvq//D2WNcX0Grjizveij1p8Zyng1btmWnoiv
         bydw==
X-Forwarded-Encrypted: i=1; AHgh+RriRDHwTTit+WZa/SE0UAFCR6BN4TxJbmmeiTiK0QtqQNMpDB41EH4B6P8XdTs7M1/dN0Y7GfkTa/wSlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPR6Yq4pT2gqRuhr1ucOl3QrHP+KMbYKW72KPNGI19o4mmLfX
	/IDsTXknYPcoIpmygBKtOlUT323jG37GP+NJuATUusT5cTvB9UA2v3dtE3P2X0qQFqM5bcXVeh8
	w5Q1bgXV6hCa8DOv792HG0I4dFwVcssw=
X-Gm-Gg: AR+sD13RfoS3cyC9cuPKbDTqjOrgajxaqJ/RF3vnCXdFy1Kkh0ZuCqcm4jCKJTh7xtJ
	zVKuj0o41lsytF0ebYnc2pHbs7vZRuAbbkk7a60D7VA/dqkE83W3hpkx/kCNw71ZOHw3qHbO090
	UNkdybcXkp/lhdnyfT9wNC/+lg9g9wVpduymJ11Un4pbkuF57z5cIvqNJNtJm1ZmCPdMYhH12/i
	LGl0VsSD3nOBAsmA1NZv6O5C2iQISq//++d0GDC3AsxqCa+5Mk1oKiGI44PXZGmuXvOgVX3befN
	A0KYy0CdbVhzoVCQK1IAdggTc7Q5tRbkjTxHOsVlLPYR3iTq66GHYDQtWg1O/QfYvf0UPwpgjDM
	=
X-Received: by 2002:a05:6830:6f85:b0:7e6:deb1:485b with SMTP id
 46e09a7af769-7f3de691f65mr27293555a34.16.1786974065393; Mon, 17 Aug 2026
 06:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815193839.141406-1-devnexen@gmail.com> <aoLZ5e0ffVvZ-FfB@zed>
In-Reply-To: <aoLZ5e0ffVvZ-FfB@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 17 Aug 2026 14:40:53 +0100
X-Gm-Features: AcwNN1USfhnetw2tQ9PDyWfNQbBpx-4phjp8VYLXp0rsU7HGDiG_ChLUo2X-AbY
Message-ID: <CA+XhMqxR+m7Jt0UUHetCfXSHHtW5w-jUc0_PSSWjTbprYn8ZwQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-isp: reject zero-sized parameter blocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Riesch <michael.riesch@collabora.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Mon, Aug 17, 2026 at 11:59:15AM +0200, Jacopo Mondi wrote:
> > whenever the driver's type_info[] entry is an uninitialised hole, so
>
> This shouldn't happen (an empty type_info[] I mean)
[...]
> > held. rppx1 has such a hole today; fix the core so the walk terminates
>
> Uh, where ?

Sorry, I should have spelled this out in the commit message.

RPPX1_PARAMS_BLOCK_INFO() is a designated initialiser indexed by the
block type (rpp_params.c:13):

      #define RPPX1_PARAMS_BLOCK_INFO(block, data) \
              [RPPX1_PARAMS_BLOCK_TYPE_ ## block] = { \
                      .size = sizeof(struct rppx1_ ## data ## _params), \
              }

so the list reads as dense but is indexed by the enum. It has 17
entries for 18 enumerators, and the missing one is AWBG_POST (== 3).
The last index used is LIN_PRE2 (== 17), so ARRAY_SIZE() is still 18
and the entry at 3 is simply zeroed.

A block with type AWBG_POST and size 0 then gets through: 0 is not
larger than the remaining buffer, and block->size != info->size is
0 != 0. block_offset and buffer_size don't move and the loop spins,
in .buf_prepare, holding the queue mutex.

> I'm not against this, but it only makes sense if the driver populates
> the list of v4l2_isp_params_block_type_info[] with an empty item,
> which shouldn't happen.

True, and rppx1 is the only one that does - rkisp1, c3-isp and
mali-c55 all look complete. What bothers me is that the loop only
terminates if every driver's table is right, and nothing checks that
at build time. A missing line in a driver would be a rejected buffer
rather than a stuck task. And a block size below its own header is
malformed anyway, whatever the type.

That said, rppx1 needs a patch either way: AWBG_POST is documented i
rppx1-config.h and the driver probes rpp->post.awbg, but the block
can't be used today - the size check compares against 0, and
rppx1_params() has no case for it in the switch.

Happy to drop a separate patch and keep only the driver fix if you prefer.

Cheers.
