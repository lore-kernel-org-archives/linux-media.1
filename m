Received: from ssl01.alldomains.hosting (ssl01.alldomains.hosting [213.145.224.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3413D668B
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.145.224.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790508205; cv=none; b=djqG74k5TDXX73aij7E1veetlwLUd3ePYLOwZZjgFsy3MFEYq0FffL8yZmmIjXR6KeA3Dv7R3nUgfk3aUBvHq8G0uqcQHifIkr8dxGjwok0/YjkbAVWfjfvuLBibr4guiqoVPztZdvALmCqfhcpKjzSMbRFmoYzYLgMAEYtJ0kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790508205; c=relaxed/simple;
	bh=DxZL8r3PrRS/DBPiEsg+58B6+Al37ZGmxOmVx20nk6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mECbHlkkeH6shxamLOuJ9hMq6sCHUnVuRfxCojjmWHqZjYjZ0fUirBRX1JE2DxnLeIAiqLus3K3NlLQ7BtDLB4IzdgtH4IGOEJ7bfbf1hzz/Y85VbnVEvhMldtLMyM2BkJYqnWZlkWvqux/AMt0YFTYBGziH/YFhZwBcN3yU7Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dittrich.top; spf=none smtp.mailfrom=dittrich.top; dkim=pass (2048-bit key) header.d=ssl01.alldomains.hosting header.i=@ssl01.alldomains.hosting header.b=dbfJMRve; arc=none smtp.client-ip=213.145.224.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dittrich.top
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dittrich.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ssl01.alldomains.hosting header.i=@ssl01.alldomains.hosting header.b="dbfJMRve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ssl01.alldomains.hosting; s=dkim; h=From:Sender:To:Cc:Subject:
	Date:Message-ID:MIME-Version:Content-Type:X-Mailer:Thread-Index:
	Content-Language; bh=So/I9qdJpn+DgDEEaJYn2VQ234TGG34OAGlHMi/cQt4
	=; b=dbfJMRvexlWZ/nC26g+xpOY7y4Rj4knBgMpJwqKOb7OAGU2CYw+RYjjlSB8
	iKaAXGrYUvpLMB7Ip42LwQPV1b+YOL3YRhRojWH+ZCm/YoiLmnVbnH6IVJT78zMN
	WvQ15bhXvojDrr7rVhCmBDFTIpC2u1gwcgnX0z0mo31oY5GZC5AVjefnDy7Coih6
	Vz0IxWX4H14mwGVdAqXjPdIfTHcR/gRhFcP9MPeyenzjJuwbZ/uvZD8pKAh75vER
	SVgiYYrcmH93I6GAWfkFIT47PxPY0HE0lxbMw4LT5weciWB39f8GEVUODngeqtpK
	WYXyZ7+smdSOm7XtXgDeM3JJDpg==
Received: (qmail 2148569 invoked by uid 7799); 27 Sep 2026 13:16:35 +0200
Received: by simscan 1.4.0 ppid: 2148553, pid: 2148564, t: 0.1007s
         scanners: clamav: 1.4.3/m:63/d:28136
Received: from unknown (HELO ROG) (michael@dittrich.top@94.31.113.139) by ssl01.alldomains.hosting with SMTP [4848]; 27 Sep 2026 13:16:35 +0200
From: <linux-media@dittrich.top>
Sender: "Michael Dittrich" <michael@dittrich.top>
To: <linux-media@vger.kernel.org>
Cc: <mchehab@kernel.org>,
	<nibble.max@gmail.com>
Subject: [BUG] media: smipcie: panic on DVB feed restart
Date: Sun, 27 Sep 2026 13:16:34 +0200
Message-ID: <000001dd4e71$a853ad30$f8fb0790$@dittrich.top>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01DD4E82.6BDCF260"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1Obl5mHQPklEXOQI2DPPVnqRTjOA==
Content-Language: de

This is a multipart message in MIME format.

------=_NextPart_000_0001_01DD4E82.6BDCF260
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Restarting VDR 2.8.2 with two DVBSky S952 V3 cards (1ade:3038,
4254:0552) caused this panic on Debian 6.12.107-1, x86-64:

  #PF: supervisor read access in kernel mode
  RIP: dvb_dmx_swfilter_packets+0x5d/0x90 [dvb_core]
  Call Trace:
   smi_dma_xfer+0x154/0x210 [smipcie]
   process_one_work+0x177/0x330
   bh_worker+0x17b/0x1a0
  Kernel panic - not syncing: Fatal exception in interrupt

The kernel was not tainted; smipcie was unmodified. VDR has local
userspace changes. A redacted panic trace is attached. The diagnostic
restart script is
available on request; there is no standalone mainline reproducer.

In drivers/media/pci/smipcie/smipcie-main.c, smi_start_feed() queues
work with the previous _int_status. This may process a stale completion
on restart; the exact IRQ sequence was not captured. smi_dma_xfer()
also accepts lengths exceeding its 192,512-byte buffer. A zero length
register is interpreted as 4 MiB and passed to the demux unchecked.

The change below clears the saved status, enables work before IRQ/DMA,
and rejects oversized lengths. The same logic, built for the Debian
kernel, passed ten service restarts and a reboot. A stubbed function
test over all 22-bit lengths passed without oversized demux calls;
it does not test IRQ concurrency.

The diff is against mainline fd179f8a05be3ccae366b9b96e176b51fbe54aab,
where both paths remain. This mainline adaptation has not been built
or hardware-tested.

Assisted-by: LLM

diff --git a/drivers/media/pci/smipcie/smipcie-main.c
b/drivers/media/pci/smipcie/smipcie-main.c
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -310,8 +310,15 @@
 				"DMA CH0 engine complete length mismatched,
finish data=%d !\n",
 				finishedData);
 		}
-		dvb_dmx_swfilter_packets(&port->demux,
-			port->cpu_addr[0], (finishedData / 188));
+		/* Reject lengths exceeding the DMA buffer. */
+		if (finishedData > SMI_TS_DMA_BUF_SIZE)
+			dev_warn_ratelimited(&dev->pci_dev->dev,
+					     "DMA CH0 invalid length %u,
dropping completion\n",
+					     finishedData);
+		else
+			dvb_dmx_swfilter_packets(&port->demux,
+						 port->cpu_addr[0],
+						 finishedData / 188);
 		/*dvb_dmx_swfilter(&port->demux,
 			port->cpu_addr[0], finishedData);*/
 	}
@@ -333,8 +340,15 @@
 				"DMA CH1 engine complete length mismatched,
finish data=%d !\n",
 				finishedData);
 		}
-		dvb_dmx_swfilter_packets(&port->demux,
-			port->cpu_addr[1], (finishedData / 188));
+		/* Reject lengths exceeding the DMA buffer. */
+		if (finishedData > SMI_TS_DMA_BUF_SIZE)
+			dev_warn_ratelimited(&dev->pci_dev->dev,
+					     "DMA CH1 invalid length %u,
dropping completion\n",
+					     finishedData);
+		else
+			dvb_dmx_swfilter_packets(&port->demux,
+						 port->cpu_addr[1],
+						 finishedData / 188);
 		/*dvb_dmx_swfilter(&port->demux,
 			port->cpu_addr[1], finishedData);*/
 	}
@@ -821,9 +835,11 @@
 	if (port->users++ == 0) {
 		dmaManagement = smi_config_DMA(port);
 		smi_port_clearInterrupt(port);
+		/* Clear stale status; let the IRQ queue work. */
+		port->_int_status = 0;
+		enable_work(&port->bh_work);
 		smi_port_enableInterrupt(port);
 		smi_write(port->DMA_MANAGEMENT, dmaManagement);
-		enable_and_queue_work(system_bh_wq, &port->bh_work);
 	}
 	return port->users;
 }

------=_NextPart_000_0001_01DD4E82.6BDCF260
Content-Type: text/plain;
	name="panic.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="panic.txt"

Redacted netconsole excerpt. Host model/BIOS, UID/PID and the=0A=
unrelated module inventory are omitted. Fault registers and trace=0A=
are preserved; the original capture is retained locally.=0A=
=0A=
[   97.726900] VDR_DIAGNOSTIC_SERVICE_RESTART_BEGIN=0A=
[  101.991897] BUG: unable to handle page fault for address: =
ffffcbce408e4000=0A=
[  101.991940] #PF: supervisor read access in kernel mode=0A=
[  101.991955] #PF: error_code(0x0000) - not-present page=0A=
[  101.991968] PGD 100000067 P4D 100000067 PUD 1001f5067 PMD 107ec0067 =
PTE 0=0A=
[  101.991993] Oops: Oops: 0000 [#1] PREEMPT SMP PTI=0A=
[  101.992010] CPU: 3 UID: [omitted] PID: [omitted] Comm: vdr Not =
tainted 6.12.107+deb13-amd64 #1  Debian 6.12.107-1=0A=
[host model and BIOS omitted]=0A=
[  101.992046] RIP: 0010:dvb_dmx_swfilter_packets+0x5d/0x90 [dvb_core]=0A=
[  101.992089] Code: 49 8d 6d ff eb 24 66 66 2e 0f 1f 84 00 00 00 00 00 =
66 66 2e 0f 1f 84 00 00 00 00 00 90 48 81 c3 bc 00 00 00 48 83 ed 01 72 =
1d <80> 3b 47 75 ee 48 89 de 4c 89 e7 48 81 c3 bc 00 00 00 e8 7c f9 ff=0A=
[  101.992110] RSP: 0018:ffffcbce401a0ea8 EFLAGS: 00010002=0A=
[  101.992125] RAX: ffff897c034505c8 RBX: ffffcbce408e4000 RCX: =
0000000000000000=0A=
[  101.992139] RDX: ffff897c034505c8 RSI: ffffcbce408e3f44 RDI: =
ffff897c03450418=0A=
[  101.992152] RBP: 0000000000005325 R08: 0000000000000000 R09: =
0000000000000000=0A=
[  101.992165] R10: 0000000000000001 R11: 0000000000000000 R12: =
ffff897c03450418=0A=
[  101.992178] R13: 0000000000005726 R14: 0000000000000246 R15: =
ffff897c034506c8=0A=
[  101.992192] FS:  00007fc3fe66bf40(0000) GS:ffff897d17b80000(0000) =
knlGS:0000000000000000=0A=
[  101.992207] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  101.992221] CR2: ffffcbce408e4000 CR3: 0000000106388003 CR4: =
00000000001726f0=0A=
[  101.992236] Call Trace:=0A=
[  101.992250]  <IRQ>=0A=
[  101.992264]  smi_dma_xfer+0x154/0x210 [smipcie]=0A=
[  101.992283]  process_one_work+0x177/0x330=0A=
[  101.992308]  bh_worker+0x17b/0x1a0=0A=
[  101.992327]  tasklet_action+0x10/0x30=0A=
[  101.992343]  handle_softirqs+0xcf/0x280=0A=
[  101.992358]  ? __pfx_read_tsc+0x10/0x10=0A=
[  101.992373]  do_softirq.part.0+0x3b/0x60=0A=
[  101.992387]  </IRQ>=0A=
[  101.992396]  <TASK>=0A=
[  101.992405]  __local_bh_enable_ip+0x60/0x70=0A=
[  101.992420]  fpu_clone+0xf8/0x400=0A=
[  101.992440]  copy_thread+0x14d/0x2a0=0A=
[  101.992457]  copy_process+0x1c47/0x2740=0A=
[  101.992476]  ? __alloc_pages_noprof+0x16b/0x310=0A=
[  101.992494]  kernel_clone+0xbd/0x440=0A=
[  101.992511]  __do_sys_clone3+0xe4/0x130=0A=
[  101.992532]  do_syscall_64+0x87/0x1b0=0A=
[  101.992549]  ? handle_mm_fault+0x1bb/0x2c0=0A=
[  101.992566]  ? do_user_addr_fault+0x36c/0x620=0A=
[  101.992582]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0=0A=
[  101.992598]  entry_SYSCALL_64_after_hwframe+0x76/0x7e=0A=
[  101.992617] RIP: 0033:0x7fc3fe22c529=0A=
[  101.992654] Code: 90 b8 01 00 00 00 b9 01 00 00 00 eb ec 0f 1f 40 00 =
b8 ea ff ff ff 48 85 ff 74 28 48 85 d2 74 23 49 89 c8 b8 b3 01 00 00 0f =
05 <48> 85 c0 7c 14 74 01 c3 31 ed 4c 89 c7 ff d2 48 89 c7 b8 3c 00 00=0A=
[  101.992674] RSP: 002b:00007ffeca7f25e8 EFLAGS: 00000202 ORIG_RAX: =
00000000000001b3=0A=
[  101.992691] RAX: ffffffffffffffda RBX: 00007fc3fe1ae620 RCX: =
00007fc3fe22c529=0A=
[  101.992705] RDX: 00007fc3fe1ae620 RSI: 0000000000000058 RDI: =
00007ffeca7f2640=0A=
[  101.992717] RBP: 00007fc3d0ff96c0 R08: 00007fc3d0ff96c0 R09: =
00007ffeca7f2737=0A=
[  101.992730] R10: 0000000000000008 R11: 0000000000000202 R12: =
fffffffffffffe90=0A=
[  101.992743] R13: 0000000000000000 R14: 00007ffeca7f2640 R15: =
00007fc3d07f9000=0A=
[  101.992760]  </TASK>=0A=
[module inventory omitted]=0A=
[  101.993088] CR2: ffffcbce408e4000=0A=
[  101.993101] ---[ end trace 0000000000000000 ]---=0A=
[  101.993113] RIP: 0010:dvb_dmx_swfilter_packets+0x5d/0x90 [dvb_core]=0A=
[  101.993146] Code: 49 8d 6d ff eb 24 66 66 2e 0f 1f 84 00 00 00 00 00 =
66 66 2e 0f 1f 84 00 00 00 00 00 90 48 81 c3 bc 00 00 00 48 83 ed 01 72 =
1d <80> 3b 47 75 ee 48 89 de 4c 89 e7 48 81 c3 bc 00 00 00 e8 7c f9 ff=0A=
[  101.993166] RSP: 0018:ffffcbce401a0ea8 EFLAGS: 00010002=0A=
[  101.993180] RAX: ffff897c034505c8 RBX: ffffcbce408e4000 RCX: =
0000000000000000=0A=
[  101.993193] RDX: ffff897c034505c8 RSI: ffffcbce408e3f44 RDI: =
ffff897c03450418=0A=
[  101.993206] RBP: 0000000000005325 R08: 0000000000000000 R09: =
0000000000000000=0A=
[  101.993219] R10: 0000000000000001 R11: 0000000000000000 R12: =
ffff897c03450418=0A=
[  101.993232] R13: 0000000000005726 R14: 0000000000000246 R15: =
ffff897c034506c8=0A=
[  101.993245] FS:  00007fc3fe66bf40(0000) GS:ffff897d17b80000(0000) =
knlGS:0000000000000000=0A=
[  101.993260] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[  101.993272] CR2: ffffcbce408e4000 CR3: 0000000106388003 CR4: =
00000000001726f0=0A=
[  101.993286] Kernel panic - not syncing: Fatal exception in interrupt=0A=
[  101.993374] Kernel Offset: 0x34400000 from 0xffffffff81000000 =
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)=0A=
[  101.993395] Rebooting in 30 seconds..=0A=

------=_NextPart_000_0001_01DD4E82.6BDCF260--

