Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6262D2487
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371160; cv=none; b=HshBvdUx25KNMLVYlQW8BBMzd8jXnjoK2BgWoxY1FhDOw8wAdlXv6LzvWxaWAKv8cWzjYkqR31X6+kgm1IcmzDWNVmYaGv7RpovOziNuilZUuwEFw6ZSIbxalCGWW8szXO6o3bBzgSiQrAJJyV0fuUhMHEMIusVpYpzX07iFw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371160; c=relaxed/simple;
	bh=gCk2UVklh44bDQQtEhtPWs8mWMnfgKQGh5YrBUXqwCw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AdbpoFfveYCsLDxi9SuWFgcFHc0fArFHr/9uYqBD6XMeGxcMHsyOhZ12csmP/06oUt9d1QLPZJPnjUba3XlGATMmOA719NYi590X8i1szTvJuj5DOZzKhmLTaCK5YmBt9sj8+TkpzPfzjy8+NjwoqaMKBBuM7KAnvYEYn/gQDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/Ftv1+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/Ftv1+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C481F000E9;
	Mon, 10 Aug 2026 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786371158;
	bh=8ivEMkGZaF761+pOxlmv1+8OzL7vQmgI81kjO2Y7fww=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Q/Ftv1+eF/LfpHPJgZv7a062/EwqIPxFEADE+/4pcXxEYLDU1IEmsd0ovJfbch701
	 49uwrYhCob+6+DAYMtp78Un0+b7MFxkO5QKEixUmZeGREYCq/Jl06G7kz7uUdihofb
	 ShvFrUPqZ9i8b0nqgho7jO4FrWtpOn84sFpD4yAXV8FoJMV+MDCyKm3qNrFrtGiAS6
	 8wfM82B0U7eyrWWFjt/4KlDhLftcj6Iv2Abt1cX4ggKPxt4IxfW3jNzDi2bZ9GJ78K
	 eObC7tY8vifrLroR+Z7u9vMs0Fk785+VTbk+w1FiH/VolJg+MmY4KxyX1aBHJqGP2k
	 yuuYvIwXJsecg==
Message-ID: <65b0c3ab-ae76-49ec-824a-b9d882c28a5c@kernel.org>
Date: Mon, 10 Aug 2026 16:12:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 11/14] media: v4l2-subdev: Add
 v4l2_subdev_call_ci_state_{active,try}
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Prabhakar
 <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-12-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260807122409.45807-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2026 14:24, Sakari Ailus wrote:
> Add v4l2_subdev_call_ci_state_active(), and
> v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
> take struct v4l2_subdev_client_info pointer as an argument. These ops
> cannot be called using v4l2_subdev_call_state_active() or
> v4l2_subdev_call_state_try() as the client_info argument precedes the
> state argument.

So if we have to jump through all these hoops just because the client_info
pointer precedes the state pointer in the pad op argument list, wouldn't it
be better to swap the order? For example by moving the client_info pointer
as the last argument?

Honestly, these macros are getting really hard to follow, and I'm not sure
it is worth it just to keep the client_info before the state pointer. Yes, that's
the logical order, but at the price of some very hard to read defines.

Or am I missing something?

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 21 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b8874eeec2e5..307655ee25e0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
>  		__result;						\
>  	})
>  
> +#define __v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
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
> +	__v4l2_subdev_call_state_active(__v4l2_subdev_call_drop_fourth,	\
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
> +	__v4l2_subdev_call_state_try(__v4l2_subdev_call_drop_fourth, sd, o, f, \
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

