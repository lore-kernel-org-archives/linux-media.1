Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622484;
	b=tbmJlnu+P4tGMhYZZKYAjgo5mvFqDDbd88obY81sBbYNQMOd2D88yyerOwOdEFSP2w47
	 ijUoDwuvCmbCjm911wBIeyvu65Akgz5/1eHQv38PAX0FMFdQi/GkhKC009HniN1UY+Ki5
	 2oLTDtNgn+hUvVWUK96NReA1HuZmCgLFX90kl3Yncq94y4rCNgn77pGWHOXhCk2r/zEmB
	 Y6W/DbVAog8wbhKNRt0UoF8jSpbp+OM+TPA5OwONO0AtpD/YFaEdziIswSfkZmu01KHHl
	 kW/9HA2o3TvusN0rdakyc/KliXyM2T5z5ODUCnYHp4rOdT4jx83etisUCZj3vsAqY4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622484;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=OQJArI4QiEaVbUk8YNO+b+T5wCZ5kVErirsvYlHXSbc=;
	b=XE2HHKoaZXegW6afvPIwk83deEoGRY/tmpNDC+0v3XkdfJQkZTx9M0U09Jgf+ojPPdjA
	 DoO0szf/J4z6Alcsxo82eol+AXrvqLIQHEb/zL/FWaHTOU+TVowTBc9whNmC8dcv9JrM/
	 17ATO3nFz32ubWC23DtaDfivg9MYHNCCNrat69QGrtW9uxGfPId/qAJd/wPtWHDImjmI9
	 GVRF4YgTkJgt51HpDkAY5oaewIuSqE6K2PD7IWT8ZwG2EXdpREljEZD+/hcit1WRzeDs8
	 Ma50nyg/yb95sxvKFDJAUfTiQ6Ntl+gld+pxMamgFF1QqPhSmz3mmUE6mjtMp1RC34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=thOm0stJ;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6840E606A31A
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 22:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6840E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=thOm0stJ
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BA4D24A;
	Thu, 22 Oct 2026 00:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792622353;
	bh=vA0wL6TvzUw2hLXXGeIjW4V8URNWxMLsmhdmOO3boIA=;
	h=Date:From:To:Cc:Subject:From;
	b=thOm0stJO2FbN6YhCg+08D89cKbSj9YIzZRi2byOYCoSAQOMqMTttFy/yY4Ee2eNB
	 EoT6X3xz+exTsbN1aHzx/hIxb26maOKi03/bOckXx4yJ1c3paKIV2ymbIFoRjAVJJD
	 0SUGpWuSzoKFdsN/5PHTyKfXIdqrHnqB3bMBC/sU=
Date: Thu, 22 Oct 2026 01:41:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Frank Li <Frank.li@oss.nxp.com>,
	Gjorgji Rosikopulos <grosikopulos@mm-sol.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Loic Poulain <lpoulain@qti.qualcomm.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Pavel Zhukov <pavel.zhukov@nxp.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Rosta Hulik <rostislav.hulik@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Tomas Babinec <tomas.babinec@nxp.com>
Subject: [ANN] Camera & ISP "unconference" - Meeting minutes
Message-ID: <20261021224119.GA383235@killaraus.ideasonboard.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

Following the Camera & ISP BoF at the Linux Plumbers Conference in
Prague, we have held a half-day meeting separate from LPC to discuss
ongoing developments in the Linux camera space. Here are the meeting
minutes. Please feel free to reply with corrections.

I would like to thank all the participants for joining, many of you
skipped half a day of LPC, or woke up very early to be with us.


# Camera & ISP microconference 2026 Prague

Attendees (in table order):

- Bryan O'Donoghue <bod@kernel.org> - Consultant
- Pavel Zhukov <pavel.zhukov@nxp.com> - NXP
- Frank Li <Frank.li@oss.nxp.com> - NXP
- Rosta Hulik <rostislav.hulik@nxp.com> - NXP
- Tomas Babinec <tomas.babinec@nxp.com> - NXP
- Rishikesh Donadkar <r-donadkar@ti.com> - TI
- Stefan Klug <stefan.klug@ideasonboard.com> - Ideas on Board
- Michael Riesch <michael.riesch@collabora.com> - Collabora
- Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> - Qualcomm
- Hans de Goede <johannes.goede@oss.qualcomm.com> - Qualcomm
- Loic Poulain <lpoulain@qti.qualcomm.com> - Qualcomm
- Nicolas Dufresne <nicolas@ndufresne.ca> - Collabora
- Lachlan Michael <Lachlan.Michael@sony.com> - Sony
- Mattijs Korpershoek <mkorpershoek@kernel.org> - Red Hat
- Maxime Ripard <mripard@kernel.org> - Red Hat
- Laurent Pinchart <laurent.pinchart@ideasonboard.com> - Ideas on Board
- Jacopo Mondi <jacopo.mondi@ideasonboard.com> - Ideas on Board

Remote attendees (in alphabetical order):

- Gjorgji Rosikopulos <grosikopulos@mm-sol.com> - MM Solutions
- Mirela Rabulea <mirela.rabulea@nxp.com> - NXP

## Agenda (tentative)

- Fault tolerance in V4L2
- RGB IR
- Multi-context support in V4L2
- Shared media graph
- Distro integration pain points

## Fault Tolerance in V4L2

In a device with multiple sensors in the media graph, a missing or
broken sensor will prevent the media pipeline from probing correctly and
no camera can be used.

Mattijs posted an
[RFC](https://lore.kernel.org/linux-media/20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org/)
with a simple proposal, implemented in one sensor driver, that could be
extended to other devices. The core idea is that sensor drivers have to
probe correctly even when the device isn't present, the media graph will
always be populated, and sensor drivers implement a new `.detect()`
function that exposes the state through a V4L2 control and a uevent.

Nicolas recommended emitting a V4L2 event from the subdev. Hans de Goede
asked if it would be useful for userspace to set the state, e.g. if it
detects the camera is dirty and unusable. Nicolas asked how to deal with
a broken sensor, would it need to be removed from the media pipeline by
userspace ? Maxime asked what happens if the link is immutable. It needs
to be mutable, or entities down the pipeline need to remove the
corresponding input from the pipeline.

Jacopo said we previously discussed emitting events from the media
device, and handling the issue at that level instead of the subdev
level. It would be nice if we could avoid modifying all sensor drivers.
The media device could emit events to tell it's complete. Mattijs said
his proposal is simpler.

Nicolas said that making the media graph topology dynamic is lots of
work for userspace, as it would need to diff versions of the topology
when a change is detected.

Maxime doesn't mind handling it at a media graph level. He would like to
handle the case where the device is broken before probing the same way
as the device becoming broken later.

Hans de Goede worries that if we register subdevs before we have a full
media graph, how do we know we're done probing ? This is a complex
problem. Maxime said it's important for userspace to know that there's
supposed to be a sensor and it doesn't work, instead of not seeing a
sensor at all.

Jacopo asked how you detect a failure after probe. Maxime said you poll,
e.g. on I2C every 10 seconds, or interrupts could be available. Hans de
Goede said that at a minimum we need solid helpers for drivers. Jacopo
said you need to power up the sensor to poll it. Polling could be done
when streaming only, but in that case userspace already have a way to
know something is wrong as images will stop being received. Nicolas said
that depending on the criticality, the hardware will be designed with
different ways to report the status.

Nicolas said we should report errors on the media device instead of
subdevs. Laurent agreed.

Laurent said that making probe succeed when the hardware is broken can
be difficult as some resources typically acquired at probe time, such as
GPIOs or regulators, may not be available due to broken hardware (e.g.
an I2C-controlled regulator on the camera module itself). Forcing sensor
drivers to not acquire any resource at probe time will make things more
complex.

Hans de Goede proposed making the media device core create the media
graph and all entities based on the DT description. Laurent explained
how drivers can create multiple subdevs for a single DT node. The media
graph would then need to be updated at runtime when a driver probes,
with the driver taking over the "empty" entity. Laurent finds the idea
interesting to explore, but it can cause lifetime management issues due
to e.g. adding new pads to an existing entity. Laurent asked what we
would do on ACPI systems. The MIPI DisCo spec may be used to get the
hardware topology and do the same as with DT.

Maxime asked how to handle with failures in the middle of the graph,
e.g. with an FPD-Link receiver breaking. Do we flag entities behind it
as broken ? Nicolas says we'll have to specify that. Laurent said that
in automotive use cases both control (I2C) and data (CSI-2) connections
break together as they typically go through serdes, but in other types
of systems we could lose data and not control or the other way around.
Hans de Goede said we could imagine all kind of degraded modes but we
don't need to necessarily support them all.

Maxime asked Nicolas for clarification about what he meant by writing a
spec. The goal is to specify behaviour exactly, so that all drivers will
behave in the same way.

Action points:

- Reworking the API to be media graph centric (media graph events,
  entity status in the media graph)
- Exploring the idea of creating entities in the media device core

## RGB IR

RGB IR sensor produce two streams from one subdevice. V4L2 controls are
per device, not per stream, so we need a new API. During the camera &
ISP BoF, we decided to add a group ID control that would be added to a
`VIDIOC_S_EXT_CTRLS` call to select a group/stream, and all other
controls in that ioctl call would apply to that stream.

Sensors may have timing requirements regarding when to send I2C
transactions to avoid misbehaviour. We decided to handle the timing
constraints in the driver, with a new API to notify sensor drivers of
timings events (e.g. start of frame notification from the CSI-2 receiver
to the sensor), and sending batched I2C writes based on those events.
The API should also support hardware where the I2C controller supports
batching writes and issuing them based on hardware events (as found in
the I2C controller found in the CAMSS of Qualcomm SoCs).

Hans de Goede mentioned we also need to think about how to control the
IR flood LED. It can be controlled directly by the sensor, or in
software by a GPIO. Tying the sensor and LED device can be done with an
ancillary link in the media device topology.

Laurent realized that the group ID control will cause problems with the
V4L2 control framework that caches control values. Extending the V4L2
control framework may be an option, but likely complex. Laurent proposed
exploring per-stream controls instead. Rishikesh said that this was
proposed two years ago at the media summit, and issues were raised
related to requests. Stream support wasn't as advanced back then.
Per-stream control should be re-explored. We discussed if the sensor
should use multiple internal pads for the RGB and IR streams. The
consensus is that we should have a single internal image pad with
multiple streams. This needs to be explored.

Stefan asked if the same should be done for multi-exposure and
multi-gain HDR. Laurent said that in those cases, especially with
sensor-side stitching, we really have multiple exposures or gains that
apply to the same frame in the same stream. Array controls seem to be
the best option in those cases. For DOL or DCG without sensor-side
stitching, per-stream control may be better. To be explored.

What do we do for timing if using a raw v4l2src GStreamer element ? Hans
de Goede said that for complex camera pipelines libcamera usage is
expected.

Mirela said that when working on HDR, they had single-value and array
controls for exposure time, and it was hard to keep the values in sync.
She eventually put the two controls in a cluster. Laurent wondered if we
could have a single control that implements both the single-value and
array behaviours. The V4L2 control framework may need extensions. Mirela
said that we don't know in the subdev driver when a `S_EXT_CTRLS` starts
and when it ends. Laurent experimented a while ago with adding new start
and end control operations but didn't pursue that further. Putting all
controls in a cluster could also be an option. It feels a bit of a hack
(Nicolas concurred), we need to talk to Hans Verkuil about it and try to
get the V4L2 control out of the way. Maybe a `.s_ext_ctrls()` operation
is the right option. If Hans Verkuil likes it, he will likely implement
it.

Action points:

- Implement per-stream controls in V4L2 and use existing controls for
  RGB-IR
- Prototype an API to give timing information to sensor drivers
- For HDR use cases, use array controls and experiment to see how to
  handle backward compatibility
- Ask Hans Verkuil about atomicity in control operations

## Multi-Context Support in V4L2

Jacopo summarized the history and current state.

Laurent asked Nicolas how he would handle a codec API today, use V4L2
controls or parameters buffers like with ISP. Nicolas would keep
controls but make them serializable in a device-specific format, to
support codecs that process parameters in firmware. Memory/resource
allocation wouldn't go through vb2 queues but follow a DRM/Vulkan model
instead.

NXP confirmed their interest in the multi-context API for the neoisp,
which can operate in either inline or offline mode. Qualcomm also has an
interest with the OPE, and IFE that can also operate in either mode.

Loic asked if scheduling is included in the API. Some hardware/firmware
handle that natively. Jacopo said it's not implemented in the prototype.
The OPE would benefit from scheduling priorities.

Jacopo is confident that the design is good. He expects effort to be
required to implement helpers once multiple drivers implement the API.
Nicolas recommends looking at the helpers only once we have multiple
drivers.

Laurent asked Loic about what the Qualcomm OPE supports in terms of
scheduling. Clocks and interconnect bandwidth is what needs to be
configured. The existing implementation bases that on frame rates.
Nicolas recommends using a deadline scheduler for this. The goal here is
more resource scaling than scheduling. Nicolas said that V4L2 makes
look-ahead difficult as it hides information and works in a "now do
this" mode.

Being able to set priorities is also needed. Loic said that context
switch could also be expensive. Jacopo said that it's mostly for the
driver to deal with. Michael would like to avoid making one single
driver "the boss", as we did before.

Loic wondered if it would make sense to use the process priority to
influence scheduling. We could "renice" ISP operation. That wouldn't
work if multiple cameras are used in a single process. What we really
need is processing images in time, so deadlines are likely better than
priorities.

Bryan asked if `drm_sched` would be a solution to schedule work between
different devices (ISP -> GPU -> NPU -> DSP -> ...). Laurent said this
should be scheduled from userspace, with kernel support for fences to
avoid going to userspace to run the next block. The DRM scheduler
handles scheduling and trigger without going to userspace, but within
one device. Those are two orthogonal issues. `<longer discussion about
how fences work in Linux here>`.

## Shared Media Graph

Michael summarized the issue. Paul Elder sent an
[RFC](https://lore.kernel.org/linux-media/20260619052637.1110672-1-paul.elder@ideasonboard.com/).
The discussions continued with the ability for multiple userspace
clients to access disjoint parts of the same media graph. We finished by
redesigning V4L2 to operate on a media device only without exposing
video devices and subdevs to userspace. Our grandchildren will be so
proud of us.

## Distro Integration Pain Points

Hans said that the biggest pain point for the soft ISP is tuning data.
LSC support is also painfully missing but Milan is working on that.
libcamera not being ABI stable is also a bit painful, but it's not too
bad as only PipeWire needs to be rebuilt. Milan is a bit more
conservative in updating in Fedora than what Hans would have done.

Debian is very conservative but they have backport repositories. Trixie
has an old libcamera, but backports ships 0.7.2.

Hans will ask if he can share calibration images he has received from
laptop vendors. For Intel laptops there's a Python script to extract CCM
data from Intel calibration files, but it's a grey area.

Users report oscillations. Switching to AgcMeanLuminance will help but
bring different oscillations. Hans would like to see the delayed
controls rework landing to help there. We continued with a discussion
about resynchronization of parameter buffers in case of errors, with a
kernel-side mechanism.

-- 
Regards,

Laurent Pinchart
