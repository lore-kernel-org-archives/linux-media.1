Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900D1514F8
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375932; cv=none; b=DIeWqioRyCqAbNtRANHTfl2FRocQOgS6RrDW+OYcn4UKU6GMPWV7Qd3dAP3XGLobZ65eEq+7hkLAy+Wja6rpbxMz4rNO5fInvR4OfrkGmy2rRCWGSYys79Ybl4ULdZYs3G59wSYxnu5CHERpdhyxr3mCaiZCzyXD45r64o8BFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375932; c=relaxed/simple;
	bh=igWoN+SxilILmJgHpfaNGC1OPAawRgD1dUFq8PRGkSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1zGjCTfLiNaiisqYtfIu0rk/c+EibmMvoU0KS6t2NE+k2NU6uYw4Ypxv8H9lSHzi8lbfioeWTfBU5fXuYpmIv9SqhWTppf9Lqw9UOIzfyUDHs/Fhx6TP5zvZIaX8E6p/PZ/VhDzQ21TMotG7pJdcRvcyhz045cpuKP0QrlLdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m16mHk5E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m16mHk5E"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3080BBB;
	Mon, 10 Aug 2026 17:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786375854;
	bh=igWoN+SxilILmJgHpfaNGC1OPAawRgD1dUFq8PRGkSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m16mHk5Ed/0iz7dmolTVbmm4HxQbANVTpdxA5T5blg7Kx3WlAbPbVsiBD6Xv3T/Fs
	 g6boD666BBUUCshwysBB+I4gS90p04zCZTqiOHqm6YLrKooP0KxjEfyZm25SQq0kHC
	 FghnqJBMwpzVZWX17cHZi42425CljQE8zKHryXn4=
Date: Mon, 10 Aug 2026 18:32:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v7 11/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <20260810153207.GC3011310@killaraus.ideasonboard.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
 <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>

On Mon, Aug 10, 2026 at 04:12:31PM +0200, Hans Verkuil wrote:
> On 07/08/2026 14:24, Sakari Ailus wrote:
> > Add v4l2_subdev_call_ci_state_active(), and
> > v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> > take struct v4l2_subdev_client_info pointer as an argument. These ops
> > cannot be called using v4l2_subdev_call_state_active() or
> > v4l2_subdev_call_state_try() as the client_info argument precedes the
> > state argument.
> 
> So if we have to jump through all these hoops just because the client_info
> pointer precedes the state pointer in the pad op argument list, wouldn't it
> be better to swap the order? For example by moving the client_info pointer
> as the last argument?
> 
> Honestly, these macros are getting really hard to follow, and I'm not sure
> it is worth it just to keep the client_info before the state pointer. Yes, that's
> the logical order, but at the price of some very hard to read defines.
> 
> Or am I missing something?

Those are exactly the points I raised in the review of v6 :-)

> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
> >  1 file changed, 74 insertions(+), 21 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index b8874eeec2e5..307655ee25e0 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >  		__result;						\
> >  	})
> >  
> > +#define __v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
> > +	v4l2_subdev_call(first, second, third, ##rest)
> > +
> > +#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
> > +	({								\
> > +		int __result;						\
> > +		struct v4l2_subdev_state *state;			\
> > +		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> > +		if (state)						\
> > +			v4l2_subdev_lock_state(state);			\
> > +		__result = call(sd, o, f, NULL, state, ##args);		\
> > +		if (state)						\
> > +			v4l2_subdev_unlock_state(state);		\
> > +		__result;						\
> > +	})
> > +
> >  /**
> >   * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
> >   *				   takes state as a parameter, passing the
> > @@ -1982,22 +1998,13 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >   * active state, lock it before calling the op and unlock it after the call.
> >   */
> >  #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> > -	({								\
> > -		int __result;						\
> > -		struct v4l2_subdev_state *state;			\
> > -		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> > -		if (state)						\
> > -			v4l2_subdev_lock_state(state);			\
> > -		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> > -		if (state)						\
> > -			v4l2_subdev_unlock_state(state);		\
> > -		__result;						\
> > -	})
> > +	__v4l2_subdev_call_state_active(__v4l2_subdev_call_drop_fourth,	\
> > +					sd, o, f, ##args)
> >  
> >  /**
> > - * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> > - *				takes state as a parameter, passing the
> > - *				subdev a newly allocated try state.
> > + * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
> > + *				      takes state as a parameter, passing the
> > + *				      subdev its active state.
> >   *
> >   * @sd: pointer to the &struct v4l2_subdev
> >   * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> > @@ -2007,13 +2014,14 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >   *     each element at &struct v4l2_subdev_ops.
> >   * @args: arguments for @f.
> >   *
> > - * This is similar to v4l2_subdev_call_state_active(), except that as this
> > - * version allocates a new state, this is only usable for
> > - * V4L2_SUBDEV_FORMAT_TRY use cases.
> > - *
> > - * Note: only legacy non-MC drivers may need this macro.
> > + * This macro is just as v4l2_subdev_call_state_active(), with the exception
> > + * that it passes NULL as the client info to sub-device ops that need it
> > + * (currently pad ops set_fmt, get_selection and set_selection).
> >   */
> > -#define v4l2_subdev_call_state_try(sd, o, f, args...)                         \
> > +#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
> > +	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
> > +
> > +#define __v4l2_subdev_call_state_try(call, sd, o, f, args...)		      \
> >  	({                                                                    \
> >  		int __result;                                                 \
> >  		static struct lock_class_key __key;                           \
> > @@ -2025,13 +2033,58 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >  			__result = PTR_ERR(state);                            \
> >  		} else {                                                      \
> >  			v4l2_subdev_lock_state(state);                        \
> > -			__result = v4l2_subdev_call(sd, o, f, state, ##args); \
> > +			__result = call(sd, o, f, NULL, state, ##args);	      \
> >  			v4l2_subdev_unlock_state(state);                      \
> >  			__v4l2_subdev_state_free(state);                      \
> >  		}                                                             \
> >  		__result;                                                     \
> >  	})
> >  
> > +/**
> > + * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> > + *				takes state as a parameter, passing the
> > + *				subdev a newly allocated try state.
> > + *
> > + * @sd: pointer to the &struct v4l2_subdev
> > + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> > + *     Each element there groups a set of callbacks functions.
> > + * @f: callback function to be called.
> > + *     The callback functions are defined in groups, according to
> > + *     each element at &struct v4l2_subdev_ops.
> > + * @args: arguments for @f.
> > + *
> > + * This is similar to v4l2_subdev_call_state_active(), except that as this
> > + * version allocates a new state, this is only usable for
> > + * V4L2_SUBDEV_FORMAT_TRY use cases.
> > + *
> > + * Note: only legacy non-MC drivers may need this macro.
> > + */
> > +#define v4l2_subdev_call_state_try(sd, o, f, args...)			      \
> > +	__v4l2_subdev_call_state_try(__v4l2_subdev_call_drop_fourth, sd, o, f, \
> > +				     ##args);
> > +
> > +/**
> > + * v4l2_subdev_call_ci_state_try - call an operation of a v4l2_subdev which
> > + *				   takes state as a parameter, passing the
> > + *				   subdev a newly allocated try state.
> > + *
> > + * @sd: pointer to the &struct v4l2_subdev
> > + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> > + *     Each element there groups a set of callbacks functions.
> > + * @f: callback function to be called.
> > + *     The callback functions are defined in groups, according to
> > + *     each element at &struct v4l2_subdev_ops.
> > + * @args: arguments for @f.
> > + *
> > + * This is similar to v4l2_subdev_call_state_try(), with the exception
> > + * that it passes NULL as the client info to sub-device ops that need it
> > + * (currently pad ops set_fmt, get_selection and set_selection).
> > + *
> > + * Note: only legacy non-MC drivers may need this macro.
> > + */
> > +#define v4l2_subdev_call_ci_state_try(sd, o, f, args...)		     \
> > +	__v4l2_subdev_call_state_try(v4l2_subdev_call, sd, o, f, ##args);
> > +
> >  /**
> >   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
> >   *

-- 
Regards,

Laurent Pinchart
