Received: from isildur.very.puzzling.org (isildur.very.puzzling.org [139.180.180.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A836F8F5;
	Thu, 16 Jul 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.180.180.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178562; cv=none; b=HaMuPhDHVyZkzIB/PHrKfokk3+11dnK0JKkZ8bUYYSJ/u9XAYio4w2OqpI+61qd1yiycvWEZfm3PYbBXW0nuIiOZ3mHDCNshOGfkIdPNUvNR8XuK9QZZST3MZHQXudxA/nCV3qA9oGAFX9r0+NAZ7v8rnptSf5lLp4HYB0Ld6RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178562; c=relaxed/simple;
	bh=pTpY0UsWlaGlTfiSavZVV5ylXQzN5taDkoLvUpmMWlE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=isqn9eQFStbJx5qW7mrhvKkWImYxU70q53eup5gQFUfZRNHXOmCCXG1CvWNs6EmgXn6hCY/aKd4aJ91+RpZ/1tGJ4/r4D0auaEA+qiEt+boO85f2SMNv5UjqT33mWpchQa8+kt+q54OFseC5vmTg3vldkVtNliyZa5YccvU03zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org; spf=pass smtp.mailfrom=very.puzzling.org; dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b=W4vzTLTj; arc=none smtp.client-ip=139.180.180.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=very.puzzling.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=very.puzzling.org header.i=@very.puzzling.org header.b="W4vzTLTj"
Received: from beren.home (unknown [115.128.81.176])
	by isildur.very.puzzling.org (Postfix) with ESMTPSA id 284DEADB;
	Thu, 16 Jul 2026 15:01:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=very.puzzling.org;
	s=beta; t=1784178081;
	bh=E4ZsyOWMUq3QorZHze2uUVhYsW9R7/HNcJe0zboUicQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From:Reply-To:To:Cc:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:MIME-Version;
	b=W4vzTLTjIHVehF2qqGGUrgTlhpArw1vQumxWrZfmn38cDL6/z9+PvbMC3eQmRt3x9
	 tVXVFqtVei/2ZDQM2QXnTUjabm6G/RgnSyHlQaypz0ognn2HjjNG+0AYzEqnZSYjKF
	 t71J1LDbcSQYz1HrcWJxwyE+hR7fuqp03TDYkyAh9aFzCJRFwAVpEMF7fNKnl0ktO3
	 BPA83euU/8sli5ZjFMhdhTeNHNBbVfHawgr6DAm7bgT37FOyaPdCP5HrDGL4Jk7TXq
	 G0uh+wqolUjiGcqVE3rQeLS8zPmxhDwNPrAGrJi2p8Pp8nIOaWX6/oXwuB1KSWQY1R
	 lENja2uFe2QFg==
Received: by beren.home (Postfix, from userid 1000)
	id 70F2C41BFB; Thu, 16 Jul 2026 15:01:19 +1000 (AEST)
From: Michael Chapman <mike@very.puzzling.org>
To: Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Chapman <mike@very.puzzling.org>
Subject: [PATCH 0/3] media: dvb-usb: fix null-ptr-deref in {cxusb,dib0700,dw2102}_disconnect
Date: Thu, 16 Jul 2026 15:01:15 +1000
Message-ID: <20260716050118.30150-1-mike@very.puzzling.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The following bug was observed when connecting a cxusb device:

    usb 1-4: new high-speed USB device number 10 using xhci_hcd
    usb 1-4: New USB device found, idVendor=3D0fe9, idProduct=3Ddb10, bcdDe=
vice=3D 1.00
    usb 1-4: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
    dvb-usb: found a 'DViCO FusionHDTV DVB-T USB (TH7579)' in cold state, w=
ill try to load a firmware
    dvb-usb: downloading firmware from file 'dvb-usb-bluebird-01.fw'
    usbcore: registered new interface driver dvb_usb_cxusb
    usb 1-4: USB disconnect, device number 10
    BUG: unable to handle page fault for address: 0000000000002c68
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0=20
    Oops: Oops: 0000 [#1] SMP PTI
    CPU: 2 UID: 0 PID: 1557026 Comm: kworker/2:0 Tainted: G          I     =
    7.0.14-201.fc44.x86_64 #1 PREEMPT(lazy)=20
    Tainted: [I]=3DFIRMWARE_WORKAROUND
    Hardware name: Gigabyte Technology Co., Ltd. To be filled by O.E.M./Z17=
0-HD3-CF, BIOS F6 02/23/2016
    Workqueue: usb_hub_wq hub_event
    RIP: 0010:cxusb_disconnect+0x19/0x90 [dvb_usb_cxusb]
    Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f=
 1f 44 00 00 55 53 48 89 fb 48 83 ec 08 48 8b bf c8 00 00 00 <48> 8b af 68 =
2c 00 00 48 81 bf 68 03 00 00 a0 e5 99 c1 74 55 48 8b
    RSP: 0018:ffffd1950c1e7b58 EFLAGS: 00010292
    RAX: ffffffffc17a9130 RBX: ffff8b7e31300c00 RCX: 0000000000000000
    RDX: 0000000000000000 RSI: ffff8b7e31300c00 RDI: 0000000000000000
    RBP: ffff8b7d10dc30b0 R08: 00000000fffffff3 R09: ffff8b7f79b13908
    R10: 000000000002fe85 R11: ffff8b7d003de810 R12: 0000000000000000
    R13: ffffffffc19884d0 R14: 0000000000000090 R15: ffff8b7e31300c50
    FS:  0000000000000000(0000) GS:ffff8b80a9d9b000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000000000002c68 CR3: 000000005b42e004 CR4: 00000000003726f0
    Call Trace:
     <TASK>
     usb_unbind_interface+0xa2/0x300
     ? device_remove+0x25/0x60
     device_release_driver_internal+0x19e/0x200
     bus_remove_device+0xfe/0x200
     ? device_remove_attrs+0xb3/0x100
     device_del+0x179/0x410
     usb_disable_device+0xe9/0x2b0
     usb_disconnect+0xef/0x320
     hub_port_connect+0x7a/0x990
     ? port_event+0x2a7/0x900
     hub_port_connect_change+0x95/0x310
     hub_event+0x177/0x570
     process_one_work+0x19e/0x3a0
     worker_thread+0x1a6/0x310
     ? __pfx_worker_thread+0x10/0x10
     kthread+0xe4/0x120
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x1a1/0x270
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in: dvb_usb_cxusb dib0070 dvb_usb xfs overlay joydev uhi=
d rfcomm snd_seq_dummy snd_hrtimer cfg80211 nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tab=
les nfnetlink bnep sunrpc dvb_pll mt352 cx88_dvb cx88_vp3054_i2c dm_crypt v=
ideobuf2_dvb dvb_core cx8802 cx8800 intel_rapl_msr intel_rapl_common cx88xx=
 intel_tcc_cooling x86_pkg_temp_thermal intel_powerclamp coretemp binfmt_mi=
sc videobuf2_dma_sg tveeprom kvm_intel kvm irqbypass btusb uvcvideo uvc vid=
eobuf2_vmalloc videobuf2_memops mei_pxp videobuf2_v4l2 videobuf2_common snd=
_usb_audio rapl snd_usbmidi_lib snd_hwdep snd_ump snd_rawmidi snd_seq video=
dev snd_seq_device snd_pcm btmtk btrtl btbcm snd_timer ee1004 btintel ppdev=
 bluetooth mc parport_pc rfkill iTCO_wdt intel_cstate intel_pmc_bxt r8169 m=
ei_hdcp parport mei_me intel_uncore intel_pmc_core pmt_telemetry pmt_discov=
ery pmt_class intel_wmi_thunderbolt
     intel_pmc_ssram_telemetry snd intel_vsec soundcore intel_pch_thermal m=
ei realtek i2c_i801 pcspkr i2c_smbus acpi_pad tun uas usb_storage raid1 gha=
sh_clmulni_intel intel_oc_wdt i915 i2c_algo_bit drm_buddy video wmi ttm drm=
_display_helper cec fuse scsi_dh_alua i2c_dev scsi_dh_rdac scsi_dh_emc
    CR2: 0000000000002c68
    ---[ end trace 0000000000000000 ]---

The device drops off the USB bus after the firmware has been loaded.
cxusb_disconnect assumes the USB interface's private data has been set,
but this is the case only when the device has been initialized in warm
state.

dib0700 and dw2102 appear to have the same bug, so the same fix was
applied to all three drivers.

Michael Chapman (3):
  media: dvb-usb: cxusb: fix null-ptr-deref in cxusb_disconnect
  media: dvb-usb: dib0700: fix null-ptr-deref in dib0700_disconnect
  media: dvb-usb: dw2102: fix null-ptr-deref in dw2102_disconnect

 drivers/media/usb/dvb-usb/cxusb.c        | 9 ++++++++-
 drivers/media/usb/dvb-usb/dib0700_core.c | 9 ++++++++-
 drivers/media/usb/dvb-usb/dw2102.c       | 9 ++++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)

--=20
2.55.0
