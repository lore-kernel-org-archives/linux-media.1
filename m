Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A34C0439
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767147; cv=none; b=mPQ6s31WN0SsprV3C92T3856mfKVmzs4yoXnRXmuPdciC8DYSjJHEDZO/y1ODXXeR8pg2Rc8DvgKMSgaGZFDK+R0v9NcX2J6RqXoj9Es+fEBM0WPfcj+M0chQ+vvW+KaAl4S4O/Iuo/N3jmN3mc3roSToNSsMj2B2oElebUPdbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767147; c=relaxed/simple;
	bh=+TNiO6bA0Lf90bdJHi/T9A8jEn00cQF1TyCgzvohxEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=fihOg77U/n2DQNCPFwkb9e2V4d0Xt6um1BPh0rogbCrXKiqJaYtOfyqnW9nV9N+L5JITMARySXmwGJhM73kaPxAhSnzxTw6cIzSaONzQuwImpU+inYAdnhv9+4SPemBSI4EORLrflIfWMsHtBH/rDD8u/SfUmqZ2YbO4NMYho3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kdgYEUl8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kdgYEUl8"
Received: from [IPV6:2a00:6020:448c:6c00:6c1f:355d:1c19:aba6] (unknown [IPv6:2a00:6020:448c:6c00:6c1f:355d:1c19:aba6])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A75A0B07;
	Wed, 30 Sep 2026 13:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790767032;
	bh=+TNiO6bA0Lf90bdJHi/T9A8jEn00cQF1TyCgzvohxEk=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=kdgYEUl8i7TjTeNATXbbx3ut9u8jiO/g8e5Y+umq5oQz2+tJi+P8Y40d3JmbjCwFj
	 AyP4xZ2JRn5RC0p9IVOif1rgbn78aAS55G2JE+4BSdEqqNV9Fw6IGZDS6k70tPN1N4
	 HqI8PrXJBHd0J4aFuKMnHj9vcBgHKS+8v1JB1pmE=
Message-ID: <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
Date: Wed, 30 Sep 2026 13:18:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Language: en-US
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Loic Poulain <lpoulain@qti.qualcomm.com>,
 Michael Riesch <michael.riesch@collabora.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

On 15.09.26 01:38, Laurent Pinchart wrote:
> Hello,
> 
> As most of you already know, the Linux Plumbers Conference will host a
> Camera & ISP BoF in Prague in three weeks ([1]).
> 
> The initial proposal for a microconference has unfortunately been
> downgraded by the program committee to a 45 minutes BoF. We have
> therefore decided to limit the discussion to three topics at most. Two
> topics have been approved so far:
> 
> - RGB-IR support in V4L2 and libcamera
> 
>   by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> 
>   The Linux kernel V4L2 API does not support RGB-IR image sensors.
>   While building blocks necessary to handle those devices are slowly
>   being merged, RGB-IR support itself hasn't been tackled yet.
> 
>   Rishikesh and Devarsh will also present this topic at the OSS Europe
>   conference ([2]).
> 
> - Camera module identification
> 
>   by Stefan Klug, Ideas on Board
> 
>   Camera tuning and calibration depend not only on the image sensor, but
>   also on the lens and other characteristics of camera modules. While
>   Linux supports identifying image sensors, it completely lacks the
>   concept of camera modules. 
> 
>   Identification of camera modules requires coordination between
>   platform firmware (DT or ACPI), the kernel and userspace. Discussions
>   will benefit from the presence of DT maintainers.
> 
LPC is already next week and we won't have enough time on the BoF for a
full introduction to the topic. So this email summarizes the Module
identification topic and contains the questions I'd like to discuss.

To the device-tree maintainers: I added you to the invitation as this
document proposes new device tree properties and I'd love to get some
feedback and common understanding on these. So if you'd be able to join,
that would be fantastic.

Most of this mail is introduction and context. If you are short on time,
please jump directly to the last headline "### 4. Camera modules without
data storage" which contains the most relevant questions.

Disclaimer: Even though it uses markdown syntax, this document is
entirely written by a human and therefore the language is not as
polished as one might expect from an AI generated one - sorry for that :-)

Best regards,
Stefan


# Camera Module identification

## Problem statement

In many cases where a camera is involved it is a so called "complex
camera", meaning a sensor is connected to an Image Signal Processing
(ISP) unit that often is part of the SoC. In most cases the sensor is
soldered to a separate PCB together with a bit of electrical
infrastructure like regulators and an eeprom. In this document I call
these "camera modules". Sometimes camera modules are sold separately
like a Raspberry Pi Camera, in other cases the module is part of bigger
device like in a modern laptop.

Sensor and ISP are orchestrated by libcamera to create a proper image
from the RAW data produced by the sensor. To be able to do that
properly, libcamera needs a "tuning file" which contains tuning
parameters for a given camera module. These tuning parameters depend not
only on the sensor model, but also on physical properties of the camera
module. These are e.g. the material and geometry of the lens in the use,
the mounting position of the lens, in extreme cases even the individual
module due to production tolerances.

So to produce a good image, libcamera must be able to select the correct
tuning file for the camera module at hand. Currently libcamera only uses
the sensor name to select the tuning file. This is not sufficient as it
misses the properties mentioned above. There is a prototype of libcamera
that implements a simple scheme that collects as much information as
possible and chooses the best fitting tuning file (in this proposed
implementation the one that matches most tags). However the exact
implementation details are out of scope for this discussion. Side note
here: Tuning files are not necessarily part of libcamera, therefore the
selection process must be a able to select a tuning file that was not
known by libcamera at compile time.

To make this a bit more concrete, here are some examples for such cases
(these are also the reference cases that I'll use in the dicussion):

1. The webcam in a modern IPU6 based laptop (meaning Intel + ACPI) that
could include camera modules with the same sensor but from different
suppliers (meaning slightly different lenses and optical characteristics)

2. Camera modules with an embedded EEPROM that contains additional data.
Think of a camera module connected to a Raspberry Pi. The data stored in
the EEPROM could be anything from a SKU, a module name, or even
calibration data like colour correction matrices and lens shading
descriptions. The format of the data stored in the EEPROM is
vendor-specific.

3. Camera modules with a sensor that has an embedded OTP memory with
additional data. Same case as before, but the sensor driver has direct
access to the data and, depending on the use-case, also knows the
internal format of the data.

4. Camera modules without data storage with the same sensor but from
different manufacturers and with different lenses (screw-on or not, wide
angle, IR cut filter,...). Same case as before but no way to identify
the module. Compared to case 1 the modules are normally sold separately
and can therefore not be inferred from the main device.

Cases 1-3 are easier to solve and added here for completeness sake. Case
4 is the main point I'd like to discuss.

## Related topic (udev/hwdb)

After my talk at the Linux Media Summit 2026 I got the feedback to look
closer at hwdb. I did that and I think it could solve parts of the problem.

For those of us who (as me) are not that familiar with udev & hwdb here
is a quick summary:

Udev and hwdb are part of systemd. They can be used without systemd so
they are also used by non-systemd setups.
Udev consists of the udev-daemon that:

- Is notified when a device is added/removed
- Runs rules that
  - Create device symlinks
  - Query sysfs
  - Query the hwdb
  - Attach properties to devices
  - Attach tags to devices
  - ...

Interestingly there is already /lib/udev/v4l_id that is used by udev to
collect some V4L properties:

```
$ /lib/udev/v4l_id /dev/video6
ID_V4L_VERSION=2
ID_V4L_PRODUCT=HD Webcam C615
ID_V4L_CAPABILITIES=:
```

This is run by udev in /lib/udev/rules.d/60-persistent-v4l.rules
And essentially executes:
SUBSYSTEM=="video4linux", IMPORT{program}="v4l_id $devnode"

hwdb is a complementary utility that adds specific rules for known hardware.

In hwdb there are already some camera specific things:
70-camera.rules and 70-cameras.hwdb  [2],[3]
which set
```
ID_INFRARED_CAMERA=0|1
ID_CAMERA_DIRECTION=front|back
```

which are used in a similar manner:

```
SUBSYSTEM=="video4linux", ENV{ID_BUS}=="usb", \
  IMPORT{builtin}="hwdb
'camera:usb:v$env{ID_VENDOR_ID}p$env{ID_MODEL_ID}:name:$attr{name}:'"
```

So udev/hwdb provides an accepted way to gain more system knowledge and
to provide that to libcamera. It is an open discussion which parts of
the detection logic should live inside libcamera and which are better
located in udev.

## Diving into the examples

Lets look at the example I listed to see how these would be solved.

### 1. Laptop with camera module from various manufacturers

I believe this can be solved by either integrating the detection logic
in libcamera and/or adding rules to udev/hwdb. But we are lacking real
examples. So if you're able to provide identification strategies for
real, existing hardware, I'd be glad to know about it. One strategy
might be to use the machine identifier provided by DMI. This is however
quite coarse and can not handle cases where the manufacturer used
different camera modules from different vendors (using the same sensor
model). ARe there for example ACPI properties that we could query for
additional information?

Q: Does anyone in this group have more details on which information to
query and where to get more details from the system?
A: ...

### 2. Camera modules with an embedded EEPROM

To make use of the EEPROM data from user space we need to carry two
elements: The EEPROM data itself and some identifier telling which
format the data in the EEPROM has. This seems relatively straightforward
and we could model it like this in dts:

dts-snippet:
imx283_0: sensor@1a {
		compatible = "sony,imx283";
    ...
    eeprom = <&eeprom>;
    eeprom-format = "vendor-a-eeprom-fmt";
};

Getting the link to the EEPROM from user space is something to
investigate. Ideas are either sysfs or media-controller.
The eeprom-format must be specified as well, to tell user space how to
interpret the EEPROM data, as it is typically not self-contained.

Q: On a first discussion on that topic we were unsure if it would be
preferred to expose the data directly in sysfs,
or to symlink to the corresponding sysfs entry for the EEPROM. Any
preferences?
A: ...

Q: Any input/things to consider from ACPI side?
A:

Q: What happens if the EEPROM driver is not loaded yet or is just not
available? Should it block/defer probing of the sensor?
A:

Q: We are missing real-life examples for these cases. So input from
vendors would be welcome.
A:

### 3. Camera modules with a sensor that has an embedded OTP memory

This case is similar to the previous one. The big difference is that the
OTP memory can be handled by the sensor driver itself, so no additional
driver is necessary. In this case a practical solution could be to
expose the OTP data via sysfs. Handling in user-space is similar to the
EEPROM case. So the device driver could expose an otp_data and
otp_format attribute in sysfs for user-space to read.

The property otp_format contains a name of the format of the OTP data.
There are cases where the format is specific to the sensor vendor and
cases where the format is specific to the module vendor. So it should be
possible to specify that in the device tree.

### 4. Camera modules without data storage

This is the most difficult and most controversial case. In this case we
can't identify the module automatically by querying the hardware. It is
also not possible to rely on the machine identifier as with example 1.
Think of an arbitrary camera module connected to a Raspberry Pi - the
machine identifier will not change just by connecting a camera.
Therefore we'd like to supply all necessary information with the device
tree.

The difficulty is that the combinations are huge and there is no common
denominator (for some modules one might be able to get an SKU, for
others it will even be difficult to get an official name).

This is quite contrary to typical device tree use-cases where we try to
tie down everything as far as possible.
A flat list of module identifiers (like compatible strings) won't work
as it should be possible to standardize aspects of a module, even if not
everything is know. Think of a Raspberry Pi Cam HQ with a screw-on lens.
It would be great to be able to specify that module, but the lens is
still up to the user.

In [1] I proposed a possible solution to that problem. A tag-based
system with a single device tree entry of space separated tags. Every
tag carries a prefix to denote a category:

Tag                 Example
m:<ModuleName>      m:vc-mipi-imx296
v:<Vendor>          v:RaspberryPi
l:<Lens>            l:generic-8mm-ircut
s:<Sku>             s:B030801
u:<user defined>    u:my-selfmade-module

This is a bit like the existing "label" property which carries a human
readable label. So an example for a module could be:

imx283_0: sensor@1a {
		compatible = "sony,imx283";
    ...
    module-info = "v:RaspberryPi m:camera-module-hq
l:generic-8mm-wide-angle";
};

This leads to the immediate question: Should we split the tags into
properties?

imx283_0: sensor@1a {
		compatible = "sony,imx283";
    ...
    module-name = "camera-module-hq";
    module-vendor = "RaspberryPi"
    module-lens = "generic-8mm-wide-angle";
};

Pros: We could try to standardize on some values.
Cons: We add a (possibly increasing) number of properties that have no
value inside the kernel and will only be populated very sparsely.

Q: Would the dtb maintainers accept such a property?
A:

Q: Are there other/better ways to convey that information?
A:

# Links:

- [1]
https://www.linuxtv.org/downloads/presentations/media_summit_2026/Stefan%20-%20Module%20Identification.pdf
- [2] https://github.com/systemd/systemd/blob/main/rules.d/70-camera.rules
- [3] https://github.com/systemd/systemd/blob/main/hwdb.d/70-cameras.hwdb

