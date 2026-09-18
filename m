Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775AA3DB328
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716991; cv=none; b=Et8XZlZmSERkJRflq7Yilkj1F1+Az7zgfdrxBJQhxXOeXUBJVIDN8XfgBbIhK2vNKfVgLFkp03H56cEjDb1Yn0l/id1a130uHRxHC8vHTiGtAtUxPU2K0W0hJW+z2JK0c8m3oTNv+TO+Nmg7Y04x24dRXIumiA/C4nNKmcRsXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716991; c=relaxed/simple;
	bh=FzjoKiQ2ca4cudR4lskQziI4A+cpS1ThXKktCVNH2R4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FDsxKkWn0lPMSXqKndkmx/oSRb9CDmPutSXqfFsUhjCqXpkzunHYKYd3Du6gLVcELW4CeCXqpqTmmwwvkL11NAd26tfIh7O++NR7Q2ZY1p9M65A/BJQOYzaEh9hFNNTQvV4pMR6X6YeqW5nE5aZM9DzudMMLBPmkJ+xeduBcIso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuRqj6id; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuRqj6id"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso260178f8f.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716982; x=1790321782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ugQW6ZS8/2LbTMMLE/FEnb7xdl9a0BnvhHWTAiKhl4Y=;
        b=FuRqj6idL45zgkSAOplKLPD9fWzJPFuYWjTT4h3i218fsLTYQWngAaVNciihTBarXQ
         fDnwrWPnbCYHOoOJAFA5ehvLRUtgwcCafGhm4fCvsjkqSSSiJKeKkluZXlY0JDb/8BVd
         Su5zYUYcvWbTCz5ggaLPXnFAjwRVY9QWZ9NuJDaq/5fnOWPVgH1Fxs9Lttskg+khbDKC
         fDTXHD3PDqtkLgoSnhcz8NfRC5cva3ic/Xzg2I8VnSnlEqByZkGT/LNMbfHxtKOWbQRk
         jIktwmodu/wsZQFiaL98SVy3w6jfuQftPqJKGGHKXpXTQ/0zp/hbOmYL4u5UwBsWJSqT
         j0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716982; x=1790321782;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugQW6ZS8/2LbTMMLE/FEnb7xdl9a0BnvhHWTAiKhl4Y=;
        b=wZRjhA3R9pFWWlkWE6GaD+qFgCHI59hUqFvxG79AZwDSZiekFE+JQlW9LycSbm7X9d
         GurFiB6AaUFZo2fnh+qQpe20q61DHMI4tIUVYsDLmMNT6LSjn8y/BI5I64vck22ljejZ
         V7pjaoyTsDmFJV0XQmniTHe9mEcUYGCv72+zw9+S/eMmyxVjjbVFaTLbR9/rqJ2gGTpr
         n0OTeifkhCqlg/iczVWjuVIhebIfMGIM3WfYCZOzbabk/8dnOn39Gp+bQgGdwlMYOe68
         Mtcqk+IvULkIdDbb3hTKHkr9+U46pQHomK24Ab+wvjZa30NXAYBhduXsEGhBVTxnasId
         FaBA==
X-Gm-Message-State: AFuF++mw2GvLnZAG+vOjbAwmgdDxN8o5vq8IV9RaCmVZvxvKj7p0X9VB
	ff7uQj0MYTLNthBnltEG5ylQYH9UVweUhk4qj9rZXtjt+0PcVdIlVQda
X-Gm-Gg: AYBFou2UbDE1FpvJ00eL30+bpnFioUOHgSsIg8/ivOSwdKhBfm159o0EWn27Dy9IbvQ
	/KTi/PFXo6VoqShZoUjXWeHbWbt2NyU1bRl4/UlM3kN423jD5ZTgaDXLCKIlET40kdrkAfL61fO
	s2p8EBt3X6W33AkPghLI+112Aq/ZUF9iI02s9HH6OMcqNPdpbkj7TP/Xnvcmse0nPOHYxCfNRRl
	Ohojlp1kgOL3Py8TCKEQEl5IwigDFjuBatjYx8HuACeFKkmRIAdYAQRtqbkgolfxAkexp5QNht3
	3jZU4T5zewv4qL3+uvgjDXf2ylI821avfQ7lRv9qw4a7my2X70vIanAKP8lE9o2zYQdQTiExqWD
	8EURazjXcdBgMf/hvxgNmOine52a3vHyYJUHv5KwQ5I2XEJaNkio2QXff+sZTJDJeHDvZLrEmWx
	X/gnkSoIxx4RDJ0o9tZ4AZ0M/f7PpUjTQ9GqYg8UfYzEctN5cWgwh2rIrDaJlO2HnboJNxcYpbq
	mslCyXaiUCsN6Js5zNXRnFkkUIBaLxcqBGrfXq9+X0c7Zo50w/UR1u7FhpoxdArgRUKN9QBxArW
	S2/7EQ9+U2i/Ld4gziAqEDHyA72o4o8qTMbBpDTnAT9q+XiOWjaKTEU/4QWSJn88+NtvfpMu17Q
	U0Y0vV+Suw2neGLTi9NfVAq1IicbA+D1urzK5hynz
X-Received: by 2002:a05:6000:4919:b0:487:10b5:a88a with SMTP id ffacd0b85a97d-4871e21aa0amr4353409f8f.9.1789716981924;
        Fri, 18 Sep 2026 00:36:21 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56021sm2210800f8f.18.2026.09.18.00.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:36:21 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com,
 mehdi.djait@linux.intel.com, ong.hock.yu@intel.com, khai.wen.ng@intel.com,
 antti.laakso@linux.intel.com, manik.bajpai@intel.com,
 divyamani.tripathi@intel.com, nicfio@gmail.com
Subject: Re: [PATCH v2 09/21] media: ipu6: Start streaming once all streams
 have started, stop when not
Date: Fri, 18 Sep 2026 09:36:19 +0200
Message-ID: <178971697984.34231.15295000197727096742@gmail.com>
In-Reply-To: <20260917113923.59004-10-sakari.ailus@linux.intel.com>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
 <20260917113923.59004-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Thu, Sep 17, 2026 at 02:39:11PM +0300, Sakari Ailus wrote:
> +static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
> +					    struct v4l2_subdev_state *state,
> +					    u32 pad, u8 *vc, bool enable)

Four things in this function, all found by reading it. I cannot build or
test a kernel at the moment, so please take this as review and nothing
more; none of it is reproduced on hardware.

1) The error return does not fit the return type.

> +	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +			       remote_pad->index, &desc);
> +	if (ret)
> +		return ret;

The function returns bool, so a negative errno from get_frame_desc()
becomes true, and both callers read true as "go ahead and change the
streaming state". In ipu6_isys_csi2_enable_streams() that starts the
firmware stream and then runs

	csi2->streaming_vc |= BIT(vc);

with vc still uninitialised: *vc is assigned only at the end of the
function, past this early return. ipu6_isys_csi2_disable_streams() does
the mirror of it with &= ~BIT(vc). The two "return false" exits are
fine, they make the caller skip the change; only this one carries a
value.

2) media_pad_remote_pad_unique() never returns NULL, so the guard below
   it is dead code.

> +		struct media_pad *video_pad =
> +			media_pad_remote_pad_unique(&asd->sd.entity.pads[route->source_pad]);
> +		struct ipu6_isys_video *av = !video_pad ? NULL :
> +			container_of_const(video_pad,
> +					   struct ipu6_isys_video, pad);
> +
> +		if (!av) {

It returns ERR_PTR(-ENOLINK) when no enabled link is found and
ERR_PTR(-ENOTUNIQ) when there is more than one. !video_pad is therefore
never true, the dev_dbg() below is unreachable, and the error pointer
goes into container_of_const() instead -- where av->streaming, a few
lines further down, dereferences it.

IS_ERR() is what the check wants. This same file already does it that
way, in ipu6_isys_csi2_get_link_freq():

	src_pad = media_pad_remote_pad_unique(...);
	if (IS_ERR(src_pad)) {
		dev_err(&csi2->isys->adev->auxdev.dev,
			"can't get source pad of %s (%pe)\n",
			csi2->asd.sd.name, src_pad);
		return PTR_ERR(src_pad);
	}

3) The lookup on the sink pad, higher up in the same function, has no
   check at all:

> +	struct media_pad *remote_pad =
> +		media_pad_remote_pad_unique(&asd->sd.entity.pads[this_route->sink_pad]);
> +	struct v4l2_subdev *remote_sd =
> +		media_entity_to_v4l2_subdev(remote_pad->entity);

remote_pad->entity is read immediately, so the same error pointer is
dereferenced here, with no guard to correct.

4) Unless I am misreading it, the inner lookup in the loop does not
   depend on the loop variable:

> +	for_each_active_route(&state->routing, route) {
> +		struct v4l2_mbus_frame_desc_entry *entry = NULL;
> +
> +		for (unsigned int i = 0; i < desc.num_entries; i++) {
> +			if (desc.entry[i].stream == this_entry->stream) {
> +				entry = &desc.entry[i];
> +				break;
> +			}
> +		}
> +
> +		if (entry->bus.csi2.vc != this_entry->bus.csi2.vc)
> +			continue;

The search key is this_entry->stream, which does not change across
iterations, so entry always ends up as this_entry itself and the vc
comparison can never differ. The "continue" is never taken and every
active route is counted, whatever its virtual channel. Going by the
commit message, the key here was meant to be route->sink_stream.

Finally, a note rather than a request. After the whole series,
ipu6_isys_csi2_enable_streams() and ipu6_isys_csi2_disable_streams()
still call media_pad_remote_pad_first() on the sink pad and dereference
the result unchecked -- and that one does return NULL. It is what my
[PATCH v2 1/3] touched. I have dropped that patch and I am not
reopening the question of the scenario behind it; I mention it only
because if the checks in 2) and 3) go in, that pointer is sitting right
next to them.

Thanks,

-- 
Nicola Fiorillo
