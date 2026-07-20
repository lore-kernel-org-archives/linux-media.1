Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7C30674E
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537165; cv=none; b=t/ihIHTuCgC/W2nttu+EnHGZtFC2H2Qv+ie+F45TAnrlUfCut5a9OhLD7/6MBbEy+QoI03RPc5kfMfcEy2TEXdM/cKIgR+cRHiJwQGPF80hITYc969Y6qoE2X/lgUnLvTftPZqU7XXaZvz/16P+LokyG+o0csrzE7Z+D0ntcjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537165; c=relaxed/simple;
	bh=LKfrYIbsJYw1+KTnCPuUzpKfUblOC7huDh6PQk4rlho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9ReoXybUccivejf02L10IvFyOiogfgN4DsBn1+NFgGkRR3xkSZ+peMg7jZ+MlKzbEHgrc+6+3O4DMtjFdBjr9oCrX66hAMo99l8IrbdsfpNNZYaclvH6c5RmNyOH9WTnyzIIrpZkQeLz1ZfV1/+HtBCsvnkaPSVJIUDVOWmTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=psU3oQvq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="psU3oQvq"
Received: from killaraus.ideasonboard.com (85-76-78-183-nat.elisa-mobile.fi [85.76.78.183])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 175A8161;
	Mon, 20 Jul 2026 10:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784537097;
	bh=LKfrYIbsJYw1+KTnCPuUzpKfUblOC7huDh6PQk4rlho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psU3oQvqvFbp/dUQwJAgZEG7WeWmOWWieg29eVN97ke5UB2uIrvj7+AFiypEdwaPD
	 Uyb32sTM5G+vsyOm9k0AAHcBilNdVjKwi2XKOl18Wj8uu8Ya9YYerv0tuYvxXAkZE5
	 McanZjI8IPuwDDDJ/xguYakRtlrdvdho2L1bsnlM=
Date: Mon, 20 Jul 2026 11:45:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
Subject: Re: [PATCH v6 13/16] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
Message-ID: <20260720084553.GD3679@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-13-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:30PM +0300, Sakari Ailus wrote:
> Add v4l2_subdev_call_ci_state_active(), and
> v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> take struct v4l2_subdev_client_info pointer as an argument. These ops
> cannot be called using v4l2_subdev_call_state_active() or
> v4l2_subdev_call_state_try() as the client_info argument precedes the
> state argument.

Is there a reason why the state argument can't go first ? This patch
then wouldn't be needed.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 21 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e08615179e7b..056eaa949786 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>  
> +#define v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
> +	v4l2_subdev_call(first, second, third, ##rest)
> +
> +#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
> +	({								\
> +		int __result;						\
> +		struct v4l2_subdev_state *state;			\
> +		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> +		if (state)						\
> +			v4l2_subdev_lock_state(state);			\
> +		__result = call(sd, o, f, NULL, state, ##args);		\
> +		if (state)						\
> +			v4l2_subdev_unlock_state(state);		\
> +		__result;						\
> +	})
> +
>  /**
>   * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
>   *				   takes state as a parameter, passing the
> @@ -1982,22 +1998,13 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>   * active state, lock it before calling the op and unlock it after the call.
>   */
>  #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
> -	({								\
> -		int __result;						\
> -		struct v4l2_subdev_state *state;			\
> -		state = v4l2_subdev_get_unlocked_active_state(sd);	\
> -		if (state)						\
> -			v4l2_subdev_lock_state(state);			\
> -		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
> -		if (state)						\
> -			v4l2_subdev_unlock_state(state);		\
> -		__result;						\
> -	})
> +	__v4l2_subdev_call_state_active(v4l2_subdev_call_drop_fourth,	\
> +					sd, o, f, ##args)
>  
>  /**
> - * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> - *				takes state as a parameter, passing the
> - *				subdev a newly allocated try state.
> + * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
> + *				      takes state as a parameter, passing the
> + *				      subdev its active state.
>   *
>   * @sd: pointer to the &struct v4l2_subdev
>   * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> @@ -2007,13 +2014,14 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>   *     each element at &struct v4l2_subdev_ops.
>   * @args: arguments for @f.
>   *
> - * This is similar to v4l2_subdev_call_state_active(), except that as this
> - * version allocates a new state, this is only usable for
> - * V4L2_SUBDEV_FORMAT_TRY use cases.
> - *
> - * Note: only legacy non-MC drivers may need this macro.
> + * This macro is just as v4l2_subdev_call_state_active(), with the exception
> + * that it passes NULL as the client info to sub-device ops that need it
> + * (currently pad ops set_fmt, get_selection and set_selection).
>   */
> -#define v4l2_subdev_call_state_try(sd, o, f, args...)                         \
> +#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
> +	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
> +
> +#define __v4l2_subdev_call_state_try(call, sd, o, f, args...)		      \
>  	({                                                                    \
>  		int __result;                                                 \
>  		static struct lock_class_key __key;                           \
> @@ -2025,13 +2033,58 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  			__result = PTR_ERR(state);                            \
>  		} else {                                                      \
>  			v4l2_subdev_lock_state(state);                        \
> -			__result = v4l2_subdev_call(sd, o, f, state, ##args); \
> +			__result = call(sd, o, f, NULL, state, ##args);	      \
>  			v4l2_subdev_unlock_state(state);                      \
>  			__v4l2_subdev_state_free(state);                      \
>  		}                                                             \
>  		__result;                                                     \
>  	})
>  
> +/**
> + * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
> + *				takes state as a parameter, passing the
> + *				subdev a newly allocated try state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This is similar to v4l2_subdev_call_state_active(), except that as this
> + * version allocates a new state, this is only usable for
> + * V4L2_SUBDEV_FORMAT_TRY use cases.
> + *
> + * Note: only legacy non-MC drivers may need this macro.
> + */
> +#define v4l2_subdev_call_state_try(sd, o, f, args...)			      \
> +	__v4l2_subdev_call_state_try(v4l2_subdev_call_drop_fourth, sd, o, f,  \
> +				     ##args);
> +
> +/**
> + * v4l2_subdev_call_ci_state_try - call an operation of a v4l2_subdev which
> + *				   takes state as a parameter, passing the
> + *				   subdev a newly allocated try state.
> + *
> + * @sd: pointer to the &struct v4l2_subdev
> + * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
> + *     Each element there groups a set of callbacks functions.
> + * @f: callback function to be called.
> + *     The callback functions are defined in groups, according to
> + *     each element at &struct v4l2_subdev_ops.
> + * @args: arguments for @f.
> + *
> + * This is similar to v4l2_subdev_call_state_try(), with the exception
> + * that it passes NULL as the client info to sub-device ops that need it
> + * (currently pad ops set_fmt, get_selection and set_selection).
> + *
> + * Note: only legacy non-MC drivers may need this macro.
> + */
> +#define v4l2_subdev_call_ci_state_try(sd, o, f, args...)		     \
> +	__v4l2_subdev_call_state_try(v4l2_subdev_call, sd, o, f, ##args);
> +
>  /**
>   * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
>   *

-- 
Regards,

Laurent Pinchart
