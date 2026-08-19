Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4235F161
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140577; cv=none; b=EaY6yLsHDJUBCMjNuTdIHiQRAzySNL7X/ZCffltmbw9KvU6lzJyQomtu48ObQbDig/YDms3++pL8H2bjhj59eV53B82V+GnoYjAgqKxsv/dYHsgJXsP99zs6albLiwURHbjqgupLmxxp2HJUphWEclnYAzMrn4EA1vmJoVs8IYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140577; c=relaxed/simple;
	bh=wapC0fzbDIfCNf14u+SYnH+wV/9Dw0Bo9RQnTh7S+NY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GXZVLkMdXc42UMkaDOu/RZ+4VtZGjGQyDCvgGohleBuVKmf0nQdAAXCOofbNNpk7IkrPHLmSvjzp13EzfxonZpN1ol5d4YSIsvC1KwTfBTp+K/hgP9axxYCAhyS23oH2foPvDBhJK5eTs0KW3sINNUPzQRs07AxJKCf8TjwEv/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOhaICFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOhaICFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C8E1F000E9;
	Wed, 19 Aug 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787140575;
	bh=ozWkUXHQ3tfKChr+tkbEoL0BJiTPjR/5LG3KXmcwfcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AOhaICFMeqR50kcdfD8ap2kAIA8fwnz8KR3tR9CJZBBchqYYgcEUjvmEsD7jUj++Y
	 fqnfEqazxkTY14fNZfh/fB9U62ZdG1oAoX0vsAd01SH9JAEGh1lbkkGLMP74xyzdIu
	 24Ii5ySga/F3U9Y+CtpA3jg62wcxZ453FJlsB5RyIQc9Bm3xYJGSRILrqKlUVZAow6
	 lONCkYSTiUVFuujvC+0MSKVafPUQhobh6gRRwua4hnXmbcCg9CvFQXI4pzLj+ew714
	 sVWog7j830ehQxN53AEikdRJrKF8/ka1AMRTcJ4x3NXVUCpqEpX/hOTdkXvbn/wHOz
	 C5KPsnlFCRFzg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 00/17] Rework frame descriptors
In-Reply-To: <aoRV18TXSBQj6U49@kekkonen.localdomain>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <87pkzl15fs.fsf@kernel.org>
 <2b31cfaf-82ca-4585-b7c8-41a15e5dcc91@ideasonboard.com>
 <87mrup129s.fsf@kernel.org> <aoRV18TXSBQj6U49@kekkonen.localdomain>
Date: Wed, 19 Aug 2026 13:56:12 +0200
Message-ID: <87pkzegw83.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Sakari,

On Tue, Aug 18, 2026 at 15:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hi Mattijs, Tomi,
>
> On Fri, Aug 14, 2026 at 11:26:23AM +0200, Mattijs Korpershoek wrote:
>> Hi Tomi,
>> 
>> On Fri, Aug 14, 2026 at 11:21, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
>> 
>> > Hi,
>> >
>> > On 14/08/2026 11:17, Mattijs Korpershoek wrote:
>> >> Hi Sakari,
>> >> 
>> >> Thank you for the series.
>> >> 
>> >> On Mon, May 18, 2026 at 19:43, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>> >> 
>> >>> Hi folks,
>> >>>
>> >>> This smallish set makes frame descriptors dynamically allocated and
>> >>> implements a single-entry frame descriptor based on the device's format,
>> >>> using a new helper called v4l2_subdev_get_frame_desc(). All drivers that
>> >>> do not obtain their frame descriptor from upstream are converted. The
>> >>> helper also obtains a frame descriptor for the desired type (parallel or
>> >>> CSI-2) and checks there's at least one entry there. These checks are
>> >>> removed from drivers that currently perform them. (Some drivers also check
>> >>> there's exactly a single frame descriptor entry but I think in most cases
>> >>> this check could be loosened. That could be done after this set.)
>> >>>
>> >>> On callee side these patches introduce no changes as the number of
>> >>> pre-allocated memory for 8 frame descriptors remains as-is. The
>> >>> get_frame_desc() pad op can return more than 8 frame descriptors by
>> >>> setting the num_entries to the desired number and returning -ENOSPC.
>> >>>
>> >>> If people prefer using cleanup.h / __free() to release the dynamically
>> >>> allocated array (I think I'd almost require that), I'll merge the
>> >>> now-separate __v4l2_subdev_get_frame_desc() into
>> >>> v4l2_subdev_get_frame_desc().
>> >>>
>> >>> More formats can be added to df-to-mbus conversion as needed. These are
>> >>> meant to be initial formats that are enough for typical raw sensors (and
>> >>> one RGB format, too).
>> >> 
>> >> I've tried this out on a AM69-SK with the Arducam FPD V3Link[1] using
>> >> the following device tree overlays:
>> >>    ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo
>> >> 
>> >> See TI's documentation about this [2]
>> >> 
>> >> I (naively) assumed that this series would replace Tomi's patch [3], but
>> >> it did not. I see the following in dmesg:
>> >> 
>> >> [  286.686574] cdns-csi2rx 4504000.csi-bridge: collect_streams: "cdns_csi2rx.4504000.csi-bridge":1: found 0x1 enabled 0x0
>> >> [  286.686754] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
>> >> [  286.700147] ds90ub960 7-0030: Failed to get source frame desc for pad 0
>> >> [  286.712679] j721e-csi2rx 4500000.ticsi2rx: enable streams "ds90ub960 7-0030":4/0x1
>> >> [  286.712684] ds90ub960 7-0030: collect_streams: "ds90ub960 7-0030":4: found 0x1 enabled 0x0
>> >> [  286.712690] ds90ub953 7-0044: Failed to get frame desc from remote subdev imx219 10-0010
>> >> [  286.725884] j721e-csi2rx 4500000.ticsi2rx: enable streams 4:0x1 failed: -515
>> >> 
>> >> Here is my camera topology:
>> >> https://paste.debian.net/hidden/7f56f635
>> >> 
>> >> I also made the following patch to attempt to convert over j721e-csi2rx:
>> >> https://paste.debian.net/hidden/314f9c32
>> >> 
>> >> Is this series indeed aimed to replace all sensor-specific
>> >> implementations of .get_frame_desc() or are patches such as the one send
>> >> from Tomi [3] still useful?
>> > I don't remember the details anymore, but probably related to my comment 
>> > in this thread:
>> >
>> > "It also looks like you only modified platform drivers. Did you check 
>> > the i2c drivers? Some call get_frame_desc().". So I think ub953 is 
>> > missing the conversion to v4l2_subdev_get_frame_desc().
>> 
>> Thanks for the hint.
>> 
>> ub953 and ub960 (which I both use) indirectly call .get_frame_desc() via
>> v4l2_subdev_get_frame_desc_passthrough().
>> 
>> So maybe v4l2_subdev_get_frame_desc_passthrough() needs an update as
>> well in this series.
>
> Using v4l2_subdev_call() is still ok as such but it won't be able to return
> more routes than it used to.
>
> I've made some changes since which I have pushed to my frame-desc branch in
> my linuxtv.org (and FDo) trees but I'm not sure if these address the issue.

The frame-desc branch addresses the issue for me. With
commit 02cef3cf1f3f ("media: v4l2-subdev: Use v4l2_subdev_get_frame_desc() for passthrough")

I see:

  root@am69-sk:~# uname -a
  Linux am69-sk 7.2.0-rc1-00331-g02cef3cf1f3f #11 SMP PREEMPT Wed Aug 19 11:34:54 CEST 2026 aarch64 GNU/Linux

  root@am69-sk:~# yavta --capture=10 --file='capture-#-srggb8.bin' --size 1920x1080 --format SRGGB8 /dev/video4
  [...]
  Captured 10 frames in 0.352748 seconds (28.348849 fps, 58784172.871734 B/s).
  8 buffers released.

And after converting to .png, the image indeed seems to be a valid capture.

Could you cc me if you post this? This way I could add a Tested-by: if
that helps.

Thanks
Mattijs

>
> -- 
> Regards,
>
> Sakari Ailus
