Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092643BDA0
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290651; cv=pass; b=kWNH6G5Xp/k1D6LBjJ1PVG1cUUi+77Y5x6RIQRtt4piopoPqTrV6Ylm8L1hdXAXIv13QT+2c3UIMPp4oYQXe9wapfcimEKaaZEd8jSrEZ3zMo7p2hdtAVUHZE9JjAZQBtuXViJuYDuxqh82ixtpf+N2uA1+5tsRc2Gwu3bM2oTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290651; c=relaxed/simple;
	bh=dcDWtIs1LbJE3AQ53wMCTJlaxq0b9bO9411uPZunBD0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q3k/SZpXIPSOma1JmaUdDPt10lGUK+zqrmJWomNcrtx7s8+oILdhqMOJuagqE5JYEBQ2HMZdxUnm5hNBEsaN5njAyF5OP+RAE3wuGOhxMLfj3FRXz1LSG+LPrNi8lPEHpBfGpbo53nOLQ6sTNWka7uprrkxIyyIfseXj1ahmI3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRiLoLB7; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRiLoLB7"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52fa9c055b5so18329121cf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788290648; cv=none;
        d=google.com; s=arc-20260327;
        b=jWOMnKb83GmNFDAhEqeyPkGEzTiKX9lej90cXJTuX3z593mAVghcWHInl3JNazI3PJ
         Ct72txML6nkWOkJbpGnz0cerecDxuk0NTj9IZ3BfEXF2iM2meO58QtFQU/55n2fKkgQo
         oLKbZGn0O5oF76QUYRdovEFjEKFsN/nVYqykFv+cNDUW/mo4unaNN/kMi5B9fc2eajoC
         lPdLh9evObBEtq2JmEmliKoQO6CNrICH2+a71dd9MiYCaS4HDNDUwMZJcIJBnIU0qKoK
         bOEfHKHXp50wRSADruTKYyeSiUXbK2guDJ/BcdpVu9P62fv1VyXF/l7+Tm1BXlzO0Sp0
         IPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dcDWtIs1LbJE3AQ53wMCTJlaxq0b9bO9411uPZunBD0=;
        fh=+m6qudvHqXklWXXV6ws3SCqyTkouu1GO5DRqiu5A1Tk=;
        b=VWv1Tyo7JD+iaf8jF0kyN8uLbnKuAtt+OWQQgoHmOag/ZYhSis1rvetQ+1J+b5ur5x
         RJ7ujoTivjIM591zUctRNTgukG1ODepGmjtAFxDX9ilJLq34JTu2A1oXNv6YsHAOMZIW
         AWCkwhXFtms8JkmXrIIM9X8XcpzBKRHNeY/37yoCiiZUJYjuiCqx+LwyLkmlAboPNK6T
         rP5jFnHFvxTqIimvD8oAcGzEn+eafExP9AjPd7L59v8MFsHPE4zPw2oZrj7KZA3fMNrv
         0Txfqut8qMcdZykzs7Y8ukRgogag67KRrxYc3g1fk3yYnwnJTI+yGdVRQUPSnbXZpXx9
         5lTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290648; x=1788895448; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDWtIs1LbJE3AQ53wMCTJlaxq0b9bO9411uPZunBD0=;
        b=GRiLoLB7Md8ey8CVt8En5TnkscxF3GnrQIBm38JGwE/cPvLHvmZkv07YJcDsB7fetF
         Na5u7Kb2UVELdivN8eUZRJEeYtVC/Kx1xL/xVx+FBYG8t2yN7SuEo99+oUG8s8jCX7Fk
         odOSi5yoaPsYQfNdaqAtIyNJayUKqYJvpAp287T8CaIudw9pXVk02hDH0aBdOG4CEh/a
         zJ6S+q0DVeUJSwU5eXfhYdkH3l88WoaTnvbFw7CGoHQL7nyhr7Drgar4SymHvkLJQMeh
         ViXCuMcmuvnsQk2B5O8a2svfY6l1UNlu0XJJl78q4VYFEmdfcvgna9HCBMBqpamx67lW
         JxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290648; x=1788895448;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dcDWtIs1LbJE3AQ53wMCTJlaxq0b9bO9411uPZunBD0=;
        b=UvuefJxyIdaLa5w6xaMMoGzHj4G6zQeT+L89FZGAntfWRBSbztt8nUZT0lLsMYJXj8
         Jx8L4G6Yg3h5VfvL4qBh0LIfh2eFubwxlFNaUPtlAyrABR6sK8p7XDt0yAiUFz3piIdM
         x8+LZbUnyMKTzooH6d7A1+V1uIFzHWbwiDYHvDebSju/dd+GkOf5mDO0Oblw7nlS7Ok1
         75FNXHHpeZL3S8yNDLGKbqcdiDMnIFzOU9a8U0i1YZl4w641AiWLODh0me/LV0z8hig7
         EKbMupLKtKj1E5qeRWJUF0sZ8gP3neYFFuROfC0KvcNglah9ia15i6L1DlaaGI12dWd+
         57Sg==
X-Gm-Message-State: AFuF++kSCkG2FXZXULjrTnq5+SkkhoKu8T+jjcNdHQjWkrmFuBTtQYLU
	dS+Uw8DPU99us8LP0Nhs+P971J+ajgHJFCJE1K8du2BR1g1ynYOfkWB+vbxUxDTGKdeRjJmGxyl
	7lSUpgj0Dg7knlhyF2tkDjVO1jk+CI3tK1zmacjM=
X-Gm-Gg: AR+sD13SgaExF/lqFiOLMTClrcS5Ryyde+xaWh1ZbBcYD8y2AUnN3xcU13FEc0vsohk
	psF5lfVADg8mCL2moKl5JEEqNpskzforuFKm5obEyY8ClDTudp4WNEaRHqQgkJdeDy9CiBNq0g6
	rlfXCw8Dstrv/vs4mippP95GpqctRNNcYl3Ooc/YTYRCSj7IyW6yXRXVOFT4pZc1QylHOczcfAi
	K/B+mGFzSmow/ikoaqpEGE6E66bTwyexJdXuDsJ3Gh3g3fLL5++q/1eaCWKyyrK0XUzYipvtQ1e
	D6O5lSbggH/PqvNNBD7HRV+Xwy/g6A+y6ql1OHinHvGmtKXmzrdqn5OVGhGaY3FpeIdwuB9HVW0
	cG4MVNNk4B+BvGnYXd6FQocUu/bjBtme3
X-Received: by 2002:a05:622a:355:b0:52e:3820:a23c with SMTP id
 d75a77b69052e-5302530eddfmr100840101cf.13.1788290648419; Tue, 01 Sep 2026
 12:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lucas Lis <lucaseze.lis@gmail.com>
Date: Tue, 1 Sep 2026 21:23:55 +0200
X-Gm-Features: AcwNN1Wy6HNT6XE3twcVQyOwDUvc3eM4rpTZRu1D5drQF-Lahbl9uWL5ZAB5ji4
Message-ID: <CAHoJVDtc-=BYmWVUggsBvrO=eYTDdk-r3Nb2064JvGn8TAdHZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com, 
	fernandorimoli11@gmail.com
Content-Type: text/plain; charset="UTF-8"

Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6
Tiger Lake (0x9a19)

Tested the v4 series on a Microsoft Surface Pro 7+: Intel Tiger Lake IPU6
(8086:9a19), front sensor enumerating as INT33BE, Fedora 44 running the
linux-surface kernel 6.19.8-3.surface.fc43.

Full build log, negative control and disassembly evidence also posted as
luqqas96 on GitHub:
https://github.com/linux-surface/linux-surface/pull/2171#issuecomment-5495563179

Base: vanilla 6.19.8 with the ov5693.c and ipu-bridge.c hunks of the
linux-surface 0013-cameras.patch applied, then this series on top. Patches 1
and 2 were already present in that tree, so they are not exercised here;
patch 6's OVTI5693 hunk needed manual application because that tree carries a
duplicate OVTI5693 entry, as reported by Fil Dunsky. Only the INT33BE path is
exercised on this machine.

With the series applied:
200/200 frames, 2592x1944, 28.64 fps
MIPI_CTRL00 (0x4800), read over i2c while streaming: 0x20

Negative control, same build with only this line removed:
- IPU_SENSOR_CONFIG_MATCH_FL("INT33BE", PCI_DEVICE_ID_INTEL_IPU6,
- CSI2_CLK_NONCONTINUOUS, 1, 419200000),

0/200 frames
MIPI_CTRL00 (0x4800), read over i2c: 0x00
intel_ipu6_isys: stream stop time out / stream close time out

Verified at the binary level that the sensor config array went from 31 to 30
entries, so exactly one entry was removed.

One difference from Fil Dunsky's negative control worth recording: he saw the
first capture after boot succeed with the entry removed, and only later
captures hang. On this machine the first capture after boot already returned
zero frames. I checked the journal for that boot: there was no earlier stream
attempt and no teardown before my test, so it really was the first stream of
that boot. I capture through libcamera rather than from the raw ISYS node, and
a desktop session had enumerated the sensor at login; either could explain the
difference, and I have not isolated which. It does not change the conclusion,
and for an end user on a normal desktop it means there is no working first
stream at all without the entry.

On the out-of-tree rebuild set: rebuilding ipu-bridge alone was sufficient
here, with an unmodified in-tree intel-ipu6 and intel-ipu6-isys. The
linux-surface Fedora kernel sets "# CONFIG_MODVERSIONS is not set", so there
is no symbol CRC check to fail. Of the five files including media/ipu-bridge.h,
only ipu-bridge.c dereferences members of struct ipu_sensor; ipu6.c only calls
ipu_bridge_init() and passes a function pointer. The "rebuild the pair"
guidance therefore applies to CONFIG_MODVERSIONS=y kernels.

Caveats on the frame counts: libcamera on this machine is not stock. It is
0.7.1 rebuilt locally with a patch that filters out the sensor's binned modes,
held back with versionlock. Capturing from the raw ISYS node as a cross-check
is not possible here: it returns csi2-4 Transfer FIFO overflow even with the
camera healthy and libcamera pulling 28.64 fps at the same time. The register
reads above do not go through libcamera; they are direct i2c reads taken while
the sensor is streaming.

This machine also carries two downstream workarounds that write
MIPI_CTRL00 = 0x2d, a polling systemd service and a locally patched ov5693.ko.
Both were stopped and removed for every measurement above, since 0x2d has bit 5
set and would have masked the result.
