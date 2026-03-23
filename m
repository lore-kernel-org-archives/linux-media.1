Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910C27874F;
	Mon, 23 Mar 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774291471; cv=none; b=CIPTWl+gFVHocxljniI5GKLYYZXvJzpqalXqK6M5QSwi4TbjaqWNKLfLfSmEGbpLpfdOysI3dLr1AP1Fc+1ueofgMlkUqfRtX6g9Xu8eUAUTjbN1luQ5Vo7MP7gBDW8Snz9cuOOHevrlKqxeBSrN1maxb/bNDosmDSA4Rp5CQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774291471; c=relaxed/simple;
	bh=zUF4c1Qz5dAr54qhWkUaZmnOrEcoh9MJ4tJr+Ahavco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W23sfuEa/xy4VRFCRzuTXbgTOdmRsJgq6IOJrgkbRLh908JQZM/kZu2/hujQLdq3V5zdLtZuevw3TnRyRS65O9ODlY4tWHphOLvJ+7zTVivdCx4cBRg8HfADzyWlMOuL8sTHqVD/SQxQI1TsdzlnD3GXb6Ib94rDznxMCdP8Ozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FYoBxu/y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FYoBxu/y"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67F93591;
	Mon, 23 Mar 2026 19:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774291390;
	bh=zUF4c1Qz5dAr54qhWkUaZmnOrEcoh9MJ4tJr+Ahavco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYoBxu/yIobjZJYlcBsvnfpiY/h2UpRzEZfZepg/kKJkBUumwyt41bqmB62cEty3U
	 eV3IWWWrv0vLmOdF1tiv1UtRH6o7ztrZuc8qJdZlXGhJbSy8X/5p7PNvhvFryhfOIe
	 QfkgRBRpzZ9/VnPxIlLWyH4MQyNh5Lb6WvAa6pPI=
Date: Mon, 23 Mar 2026 19:44:23 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Suraj Sonawane <surajsonawane0215@gmail.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5647: handle V4L2_CID_LINK_FREQ in s_ctrl
Message-ID: <acGHeFMGJVuUXVkm@zed>
References: <20260322135348.11339-1-surajsonawane0215@gmail.com>
 <CAPY8ntAKzB42sNzW+FV283rHktD3OEE9cePS4Dg1iihJtB3nyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAKzB42sNzW+FV283rHktD3OEE9cePS4Dg1iihJtB3nyA@mail.gmail.com>

Hi Dave

On Mon, Mar 23, 2026 at 03:37:37PM +0000, Dave Stevenson wrote:
> Hi Suraj
>
> On Sun, 22 Mar 2026 at 13:59, Suraj Sonawane
> <surajsonawane0215@gmail.com> wrote:
> >
> > Handle V4L2_CID_LINK_FREQ in ov5647_s_ctrl().
> >
> > Currently this control is defined but not handled in s_ctrl(),
> > so V4L2 falls back to estimating link frequency from pixel rate
> > and prints warning like:
> >
> >   v4l2_get_link_freq: Link frequency estimated using pixel rate:
> >   result might be inaccurate
> >   v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ
> >   in the transmitter driver
> >
> > Handle it as no-op since link frequency is fixed per mode and
> > not meant to be changed at runtime.
>
> I'm confused by this description compared to the patch.
>
> v4l2_get_link_freq searches for the V4L2_CID_LINK_FREQ control, and if
> found then it calls g_ctrl (not s_ctrl).
> If it can't find the control then it searches for V4L2_CID_PIXEL_RATE
> and will log the error message quoted.
>
> The control is registered by the ov5647 driver, therefore it should
> never go into that second clause, so how have you got that error
> message logged?
>
> AFAIK no part of that code path will result in a call to ov5647_s_ctrl
> that you're patching.
> I've just run with the ov5647 driver on a Pi5 (which uses
> v4l2_get_link_freq) running 7.0.0-rc5, and I can't get an error
> logged. v4l2_get_link_freq finds V4L2_CID_LINK_FREQ and uses the value
> it reports.
>
>
> You are right that ov5647_s_ctrl doesn't handle V4L2_CID_LINK_FREQ,
> which could mean that an error is returned from the __v4l2_ctrl_s_ctrl
> calls from within the driver to change the link frequency and lead to
> the dev_info in the driver being logged iff the sensor was powered up
> at the time (otherwise pm_runtime_get_if_in_use will fail). Generally
> the sensor won't be powered on as the pad format is set before
> enable_streams, and it shouldn't be possible to change it whilst
> streaming.
>
> However, as I understand it, the current preferred way to handle this
> case of read only controls where the value is changed by the driver is
> to pass NULL as the ops for the ctrl when registering. That is already
> the case looking at c6e115144b50 ("media: i2c: ov5647: Add
> V4L2_CID_LINK_FREQUENCY control"). So how are you managing to get

I was about to mention the same. Setting the ctrl ops to NULL is
preferred for controls not handled by the driver.

I'm surprised I didn't see any merged patch that address the many
faulty i2c drivers we have which manually handle the read-only
controls in their s_ctrl implementation!

We should WARN if a Read-Only control is registered with a valid
ops pointer maybe

> ov5647_s_ctrl called for control V4L2_CID_LINK_FREQ at all when it has
> no s_ctrl op?
>
> Have I totally missed something here?
>
>   Dave
>
> > Avoid these warnings when control is queried.
> >
> > Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> > ---
> >  drivers/media/i2c/ov5647.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > index 6a46ef723..a5a9cff5a 100644
> > --- a/drivers/media/i2c/ov5647.c
> > +++ b/drivers/media/i2c/ov5647.c
> > @@ -999,6 +999,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
> >                 ret = cci_write(sensor->regmap, OV5647_REG_HTS,
> >                                 sensor->mode->format.width + ctrl->val, &ret);
> >                 break;
> > +       case V4L2_CID_LINK_FREQ:
> > +               ret = 0;
> > +               break;
> >         case V4L2_CID_TEST_PATTERN:
> >                 ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
> >                                 ov5647_test_pattern_val[ctrl->val], NULL);
> > --
> > 2.34.1
> >
