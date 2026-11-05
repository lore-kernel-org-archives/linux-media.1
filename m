Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864536;
	b=C4Nh+clDvyQ37HbBqxOqI3WoqgG+lE2u5EpcUB54FGiDwREMWqNqPibpEmI+Kcjb8hBv
	 b/NkhL0RZ27A12vu8sru+9IHoTKCDBSAmSafQfFcayIcnA98o8ZhAgoQFqJ3LcmYzLgMw
	 lalfXvnxoDTHDSaG9hS5oM7CPdokDnnVxDrAuPuhUkGfDIyNo1MfLdDhSn6uAoz0JnO0P
	 RsTLbLtFpAKanMa6cb30CJNBfFx8THye6IyE5oUwDuJuQovmNkqmcJZCLiuFFXU3iGTA8
	 wNLZNx7EfqKeRfek2Btv9yQu1WPtGw3XdniG8/g1E25S8k0dcM6sgjWvXNmhm5Cfdcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864536;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:Subject:To:Content-Type:Content-Transfer-Encoding;
	bh=5rkehESqt4Gbf8rmnlvZJwiEWx3j9j/Ih3CxjQQRStQ=;
	b=C+yYXUteIBl6jOevGXjzRijhlv/70l7BZl72FT6MsSuC/dSqvrsp74x5VtoMdJFT0/gI
	 7C8g8awMgFdY1VZS0g4jYgyV9LnDYkB5en9dfCDumhOgCiQF7EdWPx7tVSvnSxWvZx2lG
	 bEnlolXjJRJAzoS8H0i3CWiw8h5/6pmWY9fl5vo7J9tycfwkuVJ+2gtrUoGvF8ZigINPk
	 cGuJyRqQhFSYlPcPIVg2bp4loaROWobhoha2+DhTmoHf3eL3eW52IWPHlTde8kAYJqfB6
	 keHjJfuLPSHXahj6N//jXYXl09YDe4EK7f/gtMW2qAmYN6CXzEBv7mWz2w2azvHiAUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBrrmjeZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F6606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBrrmjeZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B671F000C1
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864535;
	bh=5rkehESqt4Gbf8rmnlvZJwiEWx3j9j/Ih3CxjQQRStQ=;
	h=Date:From:Subject:To;
	b=DBrrmjeZ6GWBQZatqyWXBdnh7Y3MZsoa8YzeBGsNVDBYiSigiGfmKy1gmr9eeZeff
	 5xGISgnnrwEds3kUl3JF5PcfagxJOwV7nMYaEypaCdYG+K3oIXDYGPFFNJYaTolbRa
	 PAo22ZTkUixGGpfwxRZYV4SC8H1ukLH/mmoJXvofnUx0K1nvf1cQ5gOusTYN8YnhTV
	 nnjyeoTS2vzygTUIkuof2l83wEhcdZ1zPBee6Id4pmPFcbVs92kIVH7saD6LW3VZM6
	 fF3m9mHGEO2GT4mswfChlJTcWXFNr5QmiXsqsu5CPQ1aWOsSCCRD9nNggqi47kldTu
	 +Yd+wW6vcS+Qw==
Message-ID: <4f9493ba-70b1-4a13-9212-a4b41aaa3111@kernel.org>
Date: Thu, 5 Nov 2026 08:42:13 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] cec-ctl/compliance: support new HPD_PRESENT feature
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Support the new CAP, LOG_ADDRS and EVENT flags signaling the
presence of the HPD.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
The patch add support to v4l-utils for the new HPD_PRESENT CEC feature
from this patch series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=33337
---
 utils/cec-compliance/cec-test-adapter.cpp |  3 ++-
 utils/cec-ctl/cec-ctl.cpp                 | 12 ++++++++----
 utils/libcecutil/cec-info.cpp             |  4 ++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index eb00d6ac..af76cf5e 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -74,7 +74,8 @@ static int testDQEvent(struct node *node)
 	memset(&ev, 0xff, sizeof(ev));
 	fail_on_test(doioctl(node, CEC_DQEVENT, &ev));
 	fail_on_test(!(ev.flags & CEC_EVENT_FL_INITIAL_STATE));
-	fail_on_test(ev.flags & ~CEC_EVENT_FL_INITIAL_STATE);
+	fail_on_test(ev.flags & ~(CEC_EVENT_FL_INITIAL_STATE |
+				  CEC_EVENT_FL_STATE_HPD_PRESENT));
 	fail_on_test(ev.ts == 0 || ev.ts == ~0ULL);
 	fail_on_test(ev.event != CEC_EVENT_STATE_CHANGE);
 	fail_on_test(ev.state_change.log_addr_mask == 0xffff);
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 82094665..05e09444 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -511,6 +511,8 @@ static void log_event(struct cec_event &ev, bool show, bool pin_logging = false)
 {
 	bool is_high = ev.event == CEC_EVENT_PIN_CEC_HIGH;
 	bool is_initial = ev.flags & CEC_EVENT_FL_INITIAL_STATE;
+	const char *edid = (ev.flags & CEC_EVENT_FL_STATE_HPD_PRESENT) ?
+		", HPD: Present" : "";
 	__u16 pa;

 	if (ev.event != CEC_EVENT_PIN_CEC_LOW && ev.event != CEC_EVENT_PIN_CEC_HIGH &&
@@ -535,13 +537,15 @@ static void log_event(struct cec_event &ev, bool show, bool pin_logging = false)
 	case CEC_EVENT_STATE_CHANGE:
 		pa = ev.state_change.phys_addr;
 		if (show && pin_logging)
-			printf("Event: State Change: PA: %x.%x.%x.%x, LA mask: 0x%04x\n",
-			       cec_phys_addr_exp(pa), ev.state_change.log_addr_mask);
+			printf("Event: State Change: PA: %x.%x.%x.%x, LA mask: 0x%04x%s\n",
+			       cec_phys_addr_exp(pa), ev.state_change.log_addr_mask,
+			       edid);
 		else if (show)
-			printf("Event: State Change: PA: %x.%x.%x.%x, LA mask: 0x%04x, Conn Info: %s\n",
+			printf("Event: State Change: PA: %x.%x.%x.%x, LA mask: 0x%04x, Conn Info: %s%s\n",
 			       cec_phys_addr_exp(pa),
 			       ev.state_change.log_addr_mask,
-			       ev.state_change.have_conn_info ? "yes" : "no");
+			       ev.state_change.have_conn_info ? "yes" : "no",
+			       edid);
 		break;
 	case CEC_EVENT_LOST_MSGS:
 		if (show)
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index 0b0d56b9..06a4d7ad 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -66,6 +66,8 @@ static std::string caps2s(unsigned caps)
 		s += "\t\tConnector Info\n";
 	if (caps & CEC_CAP_REPLY_VENDOR_ID)
 		s += "\t\tReply Vendor ID\n";
+	if (caps & CEC_CAP_HAS_HPD_PRESENT)
+		s += "\t\tHas HPD Present\n";
 	return s;
 }

@@ -85,6 +87,8 @@ static std::string laflags2s(unsigned flags)
 		s += "CDC-Only, ";
 	if (flags & CEC_LOG_ADDRS_FL_CONFIG_FAILED)
 		s += "Config-Failed, ";
+	if (flags & CEC_LOG_ADDRS_FL_HPD_PRESENT)
+		s += "HPD-Present, ";
 	if (s.length() > 2)
 		s.erase(s.length() - 2, 2);
 	return s + ")";
-- 
2.53.0

